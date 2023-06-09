class Public::MembersController < ApplicationController
  def index
    # @member = Member.find(params[:id])
    # @members = @member.images
    @reviews = Review.order('id DESC').limit(5)
    @current_time = Time.current
  end

  def sign_up
  end

  def show
  end

  def edit
  end

end
