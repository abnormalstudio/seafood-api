class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_unauthenticated, except: [:destroy]
  layout "admin"

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      login(user)
      redirect_to default_admin_url
    else
      flash[:error] = "Email or password incorrect"
      @user = User.new
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end