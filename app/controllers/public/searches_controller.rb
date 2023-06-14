class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Menber"
      @members = Memberr.looks(params[:search], params[:word])
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
  end
end
