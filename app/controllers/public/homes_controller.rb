class Public::HomesController < ApplicationController
  def top
  end

  def about
  end
  
  def index
    @reviews4 = Review.order('id DESC').limit(4)
  end
  
end
