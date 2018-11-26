class ApplicationController < ActionController::Base
  include Pundit

  skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def logout
    session.delete(:user_id)
  end

  def login(user)
    session[:user_id] = user.id
  end

  def require_authenticated
    redirect_to new_session_url unless logged_in?
  end

  def require_unauthenticated
    redirect_to admin_root_url if logged_in?
  end

  def default_admin_url
    return admin_root_url if current_user.admin?
    return edit_admin_fishery_url(current_user.fishery) if current_user.fishery.present?
    new_admin_fishery_url
  end
end
