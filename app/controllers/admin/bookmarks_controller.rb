class Admin::BookmarksController < ApplicationController
 
  before_action :authenticate_member!
  
  def index
    member = Member.find(params[:member_id])
    @members = member.bookmarks
  end
  
  def create
    @review = Review.find(params[:review_id])
    bookmark = @review.bookmarks.new(member_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:post_id])
    bookmark = @review.bookmarks.find_by(member_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
  
end

