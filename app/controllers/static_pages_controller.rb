class StaticPagesController < ApplicationController
  def index
    @hotels = []
    top_hotels = find_top_hotels
    if top_hotels.length >= 5
      (0..4).each do |counter|
        @hotels.push(Hotel.find_by_id(top_hotels[counter]))
      end
    else
      if top_hotels.length == 0
      else
        (0..top_hotels.length-1).each do |counter|
          @hotels.push(Hotel.find_by_id(top_hotels[counter]))
        end
      end
    end
  end

  private

    def find_top_hotels
      hotels = []
      hotels_rating = RatingCache.all.order('avg DESC')
      hotels_rating.each do |hotel|
        hotels.push(hotel.cacheable_id)
      end
      hotels
    end
end