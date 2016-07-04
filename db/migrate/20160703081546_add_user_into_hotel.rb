class AddUserIntoHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :user_email, :string
  end
end