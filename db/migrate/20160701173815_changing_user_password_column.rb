class ChangingUserPasswordColumn < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_digest
    remove_column :users, :login
  end
end
