class Public::BookmarksController < ApplicationController
  before_action :authenticate_member!

  def index
    member = Member.find(params[:member_id])
    @bookmarks = member.bookmarks
    @current_time = Time.current
    @review = Review.find(params[:review_id]) unless params[:review_id].nil?
  end

  def create
    @review = Review.find(params[:review_id])
    bookmark = @review.bookmarks.new(member_id: current_member.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    bookmark = @review.bookmarks.find_by(member_id: current_member.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end

end
