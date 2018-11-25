class Admin::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_authenticated
  layout "admin"

  def require_admin
    raise Pundit::NotAuthorizedError unless current_user.admin?
  end
end