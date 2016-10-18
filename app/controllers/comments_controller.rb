class CommentsController < ApplicationController
  before_action :logged_in_user

  def new
  end

  def create
    @comment = current_user.comments.create
    @comment.body = params[:comment][:body]
    @comment.entry_id = params[:entry_id]
    if @comment.save
      redirect_to :back
    else
      @entry = Entry.find_by id: params[:entry_id]
      @user = @entry.user
      @comment = current_user.comments.build if logged_in?
      render 'entries/show'
    end
  end

  def destroy
  end
end
