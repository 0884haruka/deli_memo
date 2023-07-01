class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @member = @review.member
    @comment = current_member.comments.new(comment_params)
    @comment.review_id = @review.id
    flash[:alert] = "コメントが空です!!" unless @comment.save!
    #redirect_to request.referer　非同期通信するためリダイレクト先削除
  end

  def destroy
    @review = Review.find(params[:review_id])
    Comment.find(params[:id]).destroy
    # redirect_to request.referer　非同期通信するためリダイレクト先削除
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
