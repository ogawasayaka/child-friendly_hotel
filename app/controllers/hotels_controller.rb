class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @prefectures = Prefecture.all
    @q = Hotel.ransack(params[:q])
  end

  def search
    @q = Hotel.ransack(params[:q])
    @results = @q.result(distinct: true)
  end
end
