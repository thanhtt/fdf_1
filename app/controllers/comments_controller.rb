class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      flash[:success] = t "comments.created"
    else
      flash[:danger] = t "comments.error"
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :content,
      :user_id, :product_id
  end
end
