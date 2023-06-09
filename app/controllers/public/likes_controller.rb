class Public::LikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    like = current_member.likes.new(review_id: @review.id)
    like.save
    # redirect_to request.referer　非同期通信するためリダイレクト先削除
  end

  def destroy
    @review = Review.find(params[:review_id])
    like = current_member.likes.find_by(review_id: @review.id)
    like.destroy
    # redirect_to request.referer　非同期通信するためリダイレクト先削除
  end
end
