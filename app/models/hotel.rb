class Hotel < ActiveRecord::Base

  belongs_to :user
  has_many :posts, dependent: :destroy
  default_scope -> {order('created_at DESC')}

  validates :title,:rating,:breakfast_included,:room_description, :address, presence: true, length: {minimum:3};
  validates :price, presence: true

  mount_uploader :photo, HotelPictureUploader
end
