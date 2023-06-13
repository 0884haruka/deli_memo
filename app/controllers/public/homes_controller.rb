class Public::HomesController < ApplicationController
  def top
  end

  def about
  end
  
  def index
    @reviews = Review.order('id DESC').limit(4)
  end
  
end
