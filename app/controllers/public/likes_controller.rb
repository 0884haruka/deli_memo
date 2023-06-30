class Public::LikesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    like = current_member.likes.new(review_id: review.id)
    like.save
  end

  def destroy
    review = Review.find(params[:review_id])
    like = current_member.likes.find_by(review_id: review.id)
    like.destroy
  end
end



# destroyがターミナルでエラー起こしている、、チャットGPTだとこれ、、、あってるのか？
# def create   
#   review = Review.find(params[:review_id])
#   like = current_member.likes.new(review_id: review.id)
#   if like.save
#     review.increment!(:likes_count) # いいねのカウントをインクリメント
#   end
# end

# def destroy
#   review = Review.find(params[:review_id])
#   like = current_member.likes.find_by(review_id: review.id)
#   if like.destroy
#     review.decrement!(:likes_count) # いいねのカウントをデクリメント
#   end
# end
