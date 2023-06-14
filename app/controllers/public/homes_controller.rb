class Public::HomesController < ApplicationController
  def top
  end

  def about
  end
  
  def index
    @reviews4 = Review.order('id DESC').limit(4)
    @tags = Review.select(:prefecture).distinct
    @selected_tag = params[:tag_search]
    @reviews = if @selected_tag.present?
               Review.where(prefecture: @selected_tag)
             else
               Review.all
             end
  end
  
end
