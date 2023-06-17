class Admin::ReviewsController < ApplicationController
  def index
     @reviews = Review.all
     @current_time = Time.current #新着マーク
  end

  def list
    @member = Member.find(params[:member_id])
    @reviews = @member.reviews
  end

  def show
    @review = Review.find(params[:id])
    @member = @review.member
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(admin_review_params)
      flash[:notice] = "登録情報を更新しました。"
      redirect_to admin_review_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :price, :prefecture,:food_category,:is_active,:profile_image)
  end

  def member_params
    params.require(:review).permit(:title, :body, :profile_image, :category)
  end

end
