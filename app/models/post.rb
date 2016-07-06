class Post < ActiveRecord::Base
   belongs_to :hotel
   default_scope -> {order('created_at DESC')}

   validates :body, presence: true, length: {maximum: 150}
end
