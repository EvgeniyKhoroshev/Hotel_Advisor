class RemoveRatingFromHotels < ActiveRecord::Migration
  def change
    remove_column :hotels, :rating
    change_column :hotels, :price, :string
  end
end
