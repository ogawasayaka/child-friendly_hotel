class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @prefectures = Prefecture.all
    @q = Hotel.ransack(params[:q])
  end

  def search
    @q = Hotel.ransack(params[:q])
    @results = @q.result(distinct: true)
    @reviews = Review.where(hotel_id: params[:hotel_id])
  end
end
