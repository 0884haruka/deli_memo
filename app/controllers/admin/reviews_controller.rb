class Admin::ReviewsController < ApplicationController
  def index
     @reviews = Review.all
     @current_time = Time.current #新着マーク
  end

  def show
  end

  def edit
  end
end
