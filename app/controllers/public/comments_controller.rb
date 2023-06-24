class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @member = @review.member
    @comment = current_member.comments.new(comment_params)
    @comment.review_id = @review.id
    flash[:alert] = "コメントが空です!!" unless @comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
