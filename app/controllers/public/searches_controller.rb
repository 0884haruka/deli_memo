class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @reviews = Review.public_data #掲載のみ表示（モデルに記載、モデルのデータを引いてきた書き込み）
    @current_time = Time.current #新着マーク

    @tag_prefectures= @reviews.select(:prefecture).distinct
    @tag_food_category = @reviews.select(:food_category).distinct

    if @range == "Member"
      @members = Member.looks("partial_match", params[:word])
    else
      @reviews = Review.looks("partial_match", params[:word])
    end
    render "public/reviews/search"
  end


end
