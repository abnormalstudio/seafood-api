class Admin::FisheriesController < Admin::BaseController
  before_action :load_fishery, only: [:edit, :update]
  before_action :must_have_fishery, only: [:index]
  before_action :only_single_fishery, only: [:new, :create]

  def index
    @search = policy_scope(Fishery).search(params[:q])
    @fisheries = @search.result.paginate(page: params[:page])
  end

  def new
    @fishery = Fishery.new
  end

  def create
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
      unless current_user.admin?
        current_user.fishery = @fishery
        current_user.save!
      end

      redirect_to edit_admin_fishery_url(@fishery)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @fishery.update(fishery_params)
      redirect_to edit_admin_fishery_url(@fishery)
    else
      render :edit
    end
  end

  private

  def load_fishery
    @fishery = policy_scope(Fishery).find(params[:id])
  end

  def fishery_params
    params.require(:fishery).permit(
      :name, :address, :contact, :phone, :email, :website
    )
  end

  def only_single_fishery
    return if current_user.admin?

    if current_user.fishery.present?
      redirect_to edit_admin_fishery_url(current_user.fishery)
    end
  end

  def must_have_fishery
    return if current_user.admin?

    if current_user.fishery.blank?
      redirect_to new_admin_fishery_url
    end
  end
end