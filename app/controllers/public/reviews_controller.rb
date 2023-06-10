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
    @reviews = Review.all
    @current_time = Time.current
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "登録商品を編集しました"
      redirect_to review_path
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :price, :prefecture,:food_category,:is_active)
  end

end
