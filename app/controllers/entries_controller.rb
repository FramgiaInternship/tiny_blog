class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :author_or_admin, only: [:edit, :update, :destroy]

  def create
    @entry = current_user.entries.build entry_params
    if @entry.save
      flash[:success] = t "entries.create.success"
      redirect_to root_url
    else
      @feed_items = feed
      render "static_pages/home"
    end
  end

  def show
    @entry = Entry.find_by id: params[:id]
    @user = @entry.user
    @cmt_items = @entry.comments.order("created_at DESC")
      .paginate page: params[:page], per_page: Settings.COMMENTS_PER_PAGE
    @comment = current_user.comments.build if logged_in?
  end

  def edit
    @entry = Entry.find_by id: params[:id]
    @user = @entry.user
    @btn_submit = t "entries.edit.btn_submit"
  end

  def update
    @entry = Entry.find_by id: params[:id]
    if @entry.update_attributes(entry_params)
      flash[:success] = t "entries.edit.success"
      redirect_to @entry
    else
      @user = @entry.user
      render "edit"
    end
  end

  def destroy
    Entry.find_by(id: params[:id]).destroy
    flash[:success] = t "entries.delete.success"
    redirect_to root_url
  end

  private
  def entry_params
    params.require(:entry).permit :title, :content
  end

  # Redirect when current user is not the entry's author.
  def author_or_admin
    @entry = current_user.entries.find_by id: params[:id]
    redirect_to entry_url params[:id] if !admin? && @entry.nil?
  end
end
