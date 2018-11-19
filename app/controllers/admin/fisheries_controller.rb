class Admin::FisheriesController < Admin::BaseController
  before_action :load_fishery, only: [:edit, :update]

  def index
    @search = Fishery.search(params[:q])
    @fisheries = @search.result.paginate(page: params[:page])
  end

  def new
    @fishery = Fishery.new
  end

  def create
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
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
    @fishery = Fishery.find(params[:id])
  end

  def fishery_params
    params.require(:fishery).permit(
      :name, :address, :contact, :phone, :email, :website
    )
  end
end