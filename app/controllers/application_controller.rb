class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include EntriesHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "common.warning_login"
      redirect_to login_url
    end
  end
end
