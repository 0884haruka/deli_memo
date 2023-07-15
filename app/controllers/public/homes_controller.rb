class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    @reviews = Review.public_data #掲載のみ表示（モデルに記載、モデルのデータを引いてきた書き込み）
    @reviews_new4 = @reviews.order('id DESC').limit(4)
    @reviews_like = @reviews.includes(:liked_members).limit(10).sort {|a,b| b.liked_members.size <=> a.liked_members.size}
    # .limit(10)→いいねトップ10
  end

end
