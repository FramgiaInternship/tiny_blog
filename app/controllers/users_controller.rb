class UsersController < ApplicationController
  attr_accessor :name, :email
  def new
    @btn_submit = t "users.new.btn_submit"
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "users.new.msg_success"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
