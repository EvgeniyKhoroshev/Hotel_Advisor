class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :rating
      t.integer :breakfast_included
      t.text :room_description
      t.string :photo
      t.float :price
      t.string :address
      t.timestamps null: false
    end
  end
end
