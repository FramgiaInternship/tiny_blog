class EntriesController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @entry = current_user.entries.build entry_params
    if @entry.save
      flash[:success] = t "entries.create.success"
      redirect_to root_url
    else
      @feed_items = feed
      render 'static_pages/home'
    end
  end

  def show
    @entry = Entry.find_by id: params[:id]
    @user = @entry.user
    @cmt_items = @entry.comments.order("created_at DESC")
      .paginate page: params[:page], per_page: Settings.COMMENTS_PER_PAGE
    @comment = current_user.comments.build if logged_in?
  end

  private
  def entry_params
    params.require(:entry).permit :title, :content
  end
end
