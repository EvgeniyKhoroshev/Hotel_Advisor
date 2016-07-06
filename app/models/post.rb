class Post < ActiveRecord::Base
   belongs_to :hotel
   default_scope -> {order('created_at DESC')}

   validates :body, :title, presence: true
end
