class Admin::BaseController < ApplicationController
  before_action :require_authenticated
  layout "admin"

  def require_admin
    raise Pundit::NotAuthorizedError unless current_user.admin?
  end
end