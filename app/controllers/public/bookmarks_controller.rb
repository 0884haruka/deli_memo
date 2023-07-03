class Public::BookmarksController < ApplicationController
  before_action :authenticate_member!

  def index
    member = Member.find(params[:member_id])
    @bookmarks = member.bookmarks
    
    @current_time = Time.current
  end

  def create
    @review = Review.find(params[:review_id])
    bookmark = @review.bookmarks.new(member_id: current_member.id)
    bookmark.save
      #redirect_to request.referer 非同期通信でコメントアウト
    #else
      #redirect_to request.referer
    #end
  end

  def destroy
    @review = Review.find(params[:review_id])
    bookmark = @review.bookmarks.find_by(member_id: current_member.id)
    #if bookmark.present? 非同期通信でコメントアウト
    bookmark.destroy
    #     redirect_to request.referer
    # else
    #     redirect_to request.referer
    # end
  end

end
