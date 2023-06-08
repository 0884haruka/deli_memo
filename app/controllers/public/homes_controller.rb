class Public::HomesController < ApplicationController
  def top
    @reviews = Review.order('id DESC').limit(4)
  end

  def about
  end
end
