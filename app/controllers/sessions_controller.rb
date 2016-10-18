class SessionsController < ApplicationController
  before_action :not_logged_in,   only: [:new, :create]
  before_action :logged_in_user,  only: :destroy

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
    else
      flash.now[:danger] = t "sessions.log_in.log_in_fails"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  # Redirects login if logged in.
  def not_logged_in
    if logged_in?
      redirect_to root_url
    end
  end

  # Redirects log out if haven't logged in yet.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "sessions.log_in.not_logged_in"
      redirect_to login_url
    end
  end
end
