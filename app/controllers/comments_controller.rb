class CommentsController < ApplicationController
  before_action :logged_in_user
  def create
    @comment = current_user.comments.create
    @comment.body = params[:comment][:body]
    @comment.entry_id = params[:entry_id]
    unless @comment.save
      flash[:danger] = t "comments.cmt_fails"
    end
    redirect_to :back
  end
end
