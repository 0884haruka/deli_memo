class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Menber"
      @members = Member.looks(params[:search], params[:word])
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
  end
end
