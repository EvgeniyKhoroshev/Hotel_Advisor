class Hotel < ActiveRecord::Base

  belongs_to :user
  has_many :posts, dependent: :destroy
  default_scope -> {order('created_at DESC')}

  ratyrate_rateable 'hotel_rating'

  validates :title,:breakfast_included,:room_description, :address, presence: true, length: {minimum:3};

  mount_uploader :photo, HotelPictureUploader
end
