class DeleteUserEmailFromHotels < ActiveRecord::Migration
  def change
    remove_column :hotels, :user_email
  end
end
