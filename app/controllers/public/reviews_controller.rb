class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member, only: [:edit, :new]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.member_id = current_member.id
    if @review.save
      redirect_to mypage_path(current_member)
    else
      render :new
    end
  end

  def index
    #@reviews = Review.public_data #掲載のみ表示（モデルに記載、モデルのデータを引いてきた書き込み）
    @reviews = Review.public_data.page(params[:page])
    @current_time = Time.current #新着マーク
    @selected_prefecture = params[:prefectur_search]
    @selected_food_category = params[:food_category_search]

    @tag_prefectures= @reviews.select(:prefecture).distinct
    @tag_food_category = @reviews.select(:food_category).distinct

    if @selected_prefecture.present?
      @reviews = @reviews.where(prefecture: @selected_prefecture)
      render :search
    end
    if @selected_food_category.present?
      @reviews = @reviews.where(food_category: @selected_food_category)
      render :search
    end


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
    if @review.update!(review_params)
      flash[:notice] = "投稿を編集しました☺︎"
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

  def search
    @reviews = Review.public_data.looks("partial_match", params[:word])
    @tag_prefectures= @reviews.select(:prefecture).distinct
    @tag_food_category = @reviews.select(:food_category).distinct
  end


  private

  def review_params
    params.require(:review).permit(:title, :body, :review_image, :price, :prefecture,:food_category,:is_active,:profile_image)
  end

  def member_params
    params.require(:review).permit(:title, :body, :profile_image, :category)
  end

  def ensure_guest_member
    if current_member.name == "guestmember"
      flash[:notice] = "レビュー投稿は新規会員登録後にご利用いただけます。"
      redirect_to root_path, notice: "レビュー投稿は新規会員登録後にご利用いただけます。"
    end
  end

end
