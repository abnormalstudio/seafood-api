class Admin::CatchesController < Admin::BaseController
  before_action :load_catch, only: [:edit, :update]

  def index
    @search = Catch.includes(:fish, :fishery).search(params[:q])
    @catches = @search.result.paginate(page: params[:page])
  end

  def new
    @catch = Catch.new
  end

  def create
    @catch = Catch.new(catch_params)
    if @catch.save
      redirect_to edit_admin_catch_url(@catch)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @catch.update(catch_params)
      redirect_to edit_admin_catch_url(@catch)
    else
      render :edit
    end
  end

  private

  def load_catch
    @catch = Catch.find(params[:id])
  end

  def catch_params
    params.require(:catch).permit(
      :fish_id, :fishery_id, :caught_on, :latitude, :longitude, :code, :location
    )
  end
end