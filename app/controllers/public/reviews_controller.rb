class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.save
    redirect_to mypage_path
  end

  def index
  end

  def edit
  end

  def show
  end
  
  private

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :price, :prefecture,:food_category,:is_active)
  end
  
end
