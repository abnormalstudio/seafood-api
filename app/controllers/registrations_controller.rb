class RegistrationsController < ApplicationController
  before_action :require_unauthenticated
  layout "admin"

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    if @user.save
      login(@user)
      redirect_to default_admin_url
    else
      flash[:error] = "Please correct validation errors"
      render :new
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password)
  end
end