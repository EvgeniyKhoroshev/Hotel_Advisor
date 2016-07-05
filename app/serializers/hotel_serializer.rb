class HotelSerializer <  ActiveModel::Serializer
  attributes :id, :title, :rating, :breakfast_included, :room_description,:price, :address, :user_id, :photo
end