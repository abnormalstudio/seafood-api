class Admin::FishesController < Admin::BaseController
  before_action :require_admin
  before_action :load_fish, only: [:edit, :update]

  def index
    @search = Fish.search(params[:q])
    @fishes = @search.result.paginate(page: params[:page])
  end

  def new
    @fish = Fish.new
  end

  def create
    @fish = Fish.new(fish_params)
    if @fish.save
      redirect_to edit_admin_fish_url(@fish)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @fish.update(fish_params)
      redirect_to edit_admin_fish_url(@fish)
    else
      render :edit
    end
  end

  private

  def load_fish
    @fish = Fish.find(params[:id])
  end

  def fish_params
    params.require(:fish).permit(
      :species, :mercury_mean_ppm, :mercury_num_samples
    )
  end
end