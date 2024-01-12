class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @prefectures = Prefecture.all
    @q = Hotel.ransack(params[:q])
  end

  def search
    @q = Hotel.ransack(params[:q])
    @results = @q.result(distinct: true)
    reviews_age_eq = params[:q][:reviews_age_eq]
    if reviews_age_eq.present?
      @reviews = Review.joins(:hotel).merge(@results).where(age: reviews_age_eq)
    else
      @reviews = Review.joins(:hotel).merge(@results)
    end
  end
end
