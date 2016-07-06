class ChangePriceType < ActiveRecord::Migration
  def change
    change_column :hotels, :price, :integer
  end
end
