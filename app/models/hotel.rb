class Hotel < ActiveRecord::Base
  validates :title,:rating,:breakfast_included,:room_description, :address, presence: true, length: {minimum:3};
  validates :price, presence: true
  # validates :photo,

  mount_uploader :photo, HotelPictureUploader
end