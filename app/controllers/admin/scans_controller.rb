class Admin::ScansController < Admin::BaseController
  before_action :load_catch
  before_action :load_scan, only: [:edit, :update, :destroy]

  def index
    @search = @catch.scans.search(params[:q])
    @scans = @search.result.paginate(page: params[:page])
  end

  def new
    @scan = @catch.scans.new
  end

  def create
    @scan = @catch.scans.new(scan_params)
    if @scan.save
      redirect_to edit_admin_catch_url(@catch)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scan.update(scan_params)
      redirect_to edit_admin_catch_url(@catch)
    else
      render :edit
    end
  end

  def destroy
    @scan.destroy!
    redirect_to edit_admin_catch_url(@catch)
  end

  private

  def load_catch
    @catch = Catch.find(params[:catch_id])
  end

  def load_scan
    @scan = @catch.scans.find(params[:id])
  end

  def scan_params
    temp = params.require(:scan).permit(
      :scanner, :scanned_at, :latitude, :longitude, scanned_at: [:date, :time]
    )
    temp[:scanned_at] = "#{temp[:scanned_at][:date]}T#{temp[:scanned_at][:time]}"
    temp
  end
end