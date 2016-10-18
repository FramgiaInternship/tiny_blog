class UsersController < ApplicationController
  before_action :logged_in_user, only: [:following, :followers, :index, :show, :delete]
  before_action :admin_user, only: :destroy
  attr_accessor :name, :email

  def index
    @users = get_users
  end

  def show
    @user = User.includes(:entries).find_by id: params[:id]
  end

  def new
    @btn_submit = t "user.new.btn_submit"
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "user.new.msg_success"
      log_in @user
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @user = current_user
    @btn_submit = t "user.edit.btn_submit"
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "user.edit.success"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    user =  User.find_by(id: params[:id])
    if user
      user.destroy
      flash[:success] = t "user.delete.success"
      redirect_to users_url
    else
      @users = get_users
      render "index"
    end
  end

  def following
    @title = t "user.index.following_title"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render "show_follow"
  end

  def followers
    @title = t "user.index.follower_title"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow"
  end

  private
  def user_params
    params.require(:user)
      .permit :name, :email, :password, :password_confirmation
  end

  # Confirms an admin user.
  def admin_user
    redirect_to users_url unless current_user.admin?
  end
end
