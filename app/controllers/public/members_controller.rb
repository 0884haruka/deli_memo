class Public::MembersController < ApplicationController
  def index
    @reviews = Review.all
  end

  def sign_up
  end

  def show
  end


end
