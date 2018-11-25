class Admin::ReportsController < Admin::BaseController
  before_action :require_admin

  def index
    @search = Report.includes(catch: :fishery).search(params[:q])
    @reports = @search.result.paginate(page: params[:page])
  end
end