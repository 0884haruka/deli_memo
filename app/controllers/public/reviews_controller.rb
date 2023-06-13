class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit, :new]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    @review.save
    redirect_to mypage_path(current_member)
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
    @comment = Comment.new
    @member = @review.member
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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :price, :prefecture,:food_category,:is_active,:profile_image)
  end

  def ensure_guest_member
    if current_member.name == "guestmember"
      flash[:notice] = "レビュー投稿、いいね♡、コメントは新規会員登録後にご利用いただけます。"
      redirect_to new_member_registration_path
    end
  end

end
