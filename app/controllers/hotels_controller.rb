class HotelsController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'json'

  def index
    @hotels = Hotel.all
    @prefectures = Prefecture.all
    @q = Hotel.ransack(params[:q])
  end

  def search
    @q = Hotel.ransack(params[:q])
    @results = @q.result(distinct: true)
    reviews_age_eq = params[:q][:reviews_age_eq]
    if reviews_age_eq == 'on'
      @reviews = Review.joins(:hotel).merge(@results)
    else
      @reviews = Review.joins(:hotel).merge(@results).where(age: reviews_age_eq)
    end
  
    
    @hotel_apis = []
  
    @results.each do |hotel|
      hotel.name = hotel.name[0, 20]
      encoded_name = URI.encode_www_form_component(hotel.name)
  
      rakuten_url = "https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&searchField=1&hotelThumbnailSize=1&elements=hotelName,address1,address2,hotelImageUrl,roomImageUrl,reviewCount,reviewAverage&formatVersion=2&keyword=#{encoded_name}&applicationId=#{ENV['id']}"
      uri = URI.parse(rakuten_url)
      response = Net::HTTP.get_response(uri)
      detail = JSON.parse(response.body)
      if detail && detail["hotels"] && detail["hotels"][0] && detail["hotels"][0][0] && detail["hotels"][0][0]["hotelBasicInfo"]
        hotel_api = {
          hotel_name: detail["hotels"][0][0]["hotelBasicInfo"]["hotelName"],
          address1: detail["hotels"][0][0]["hotelBasicInfo"]["address1"],
          address2: detail["hotels"][0][0]["hotelBasicInfo"]["address2"],
          hotel_image: detail["hotels"][0][0]["hotelBasicInfo"]["hotelImageUrl"],
          room_image: detail["hotels"][0][0]["hotelBasicInfo"]["roomImageUrl"],
          review_count: detail["hotels"][0][0]["hotelBasicInfo"]["reviewCount"],
          review_average: detail["hotels"][0][0]["hotelBasicInfo"]["reviewAverage"]
        }
        @hotel_apis << hotel_api
      end
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @hotel_api = fetch_hotel_api(@hotel.name)
    @reviews = @hotel.reviews
  end

    private

  def fetch_hotel_api(hotel_name)
    encoded_name = URI.encode_www_form_component(hotel_name)
    rakuten_url = "https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&elements=hotelName,address1,address2,hotelImageUrl,roomImageUrl,reviewCount,reviewAverage,hotelMinCharge,access,roomFacilities,hotelFacilities,aboutMealPlace,breakfastPlace,dinnerPlace,aboutBath,bathType,hotelSpecial&formatVersion=2&searchField=1&responseType=large&keyword=#{encoded_name}&applicationId=#{ENV['id']}"
    uri = URI.parse(rakuten_url)
    response = Net::HTTP.get_response(uri)
    detail = JSON.parse(response.body)


    if detail && detail["hotels"] && detail["hotels"][0] && detail["hotels"][0][0] && detail["hotels"][0][0]["hotelBasicInfo"]
    {
      hotel_name: detail["hotels"][0][0]["hotelBasicInfo"]["hotelName"],
      address1: detail["hotels"][0][0]["hotelBasicInfo"]["address1"],
      address2: detail["hotels"][0][0]["hotelBasicInfo"]["address2"],
      hotel_image: detail["hotels"][0][0]["hotelBasicInfo"]["hotelImageUrl"],
      room_image: detail["hotels"][0][0]["hotelBasicInfo"]["roomImageUrl"],
      review_count: detail["hotels"][0][0]["hotelBasicInfo"]["reviewCount"],
      review_average: detail["hotels"][0][0]["hotelBasicInfo"]["reviewAverage"],
      access: detail["hotels"][0][0]["hotelBasicInfo"]["access"],
      min_charge: detail["hotels"][0][0]["hotelBasicInfo"]["hotelMinCharge"],
      hotel_special: detail["hotels"][0][0]["hotelBasicInfo"]["hotelSpecial"],
      
  }
    else
      nil
    end
  end
end
