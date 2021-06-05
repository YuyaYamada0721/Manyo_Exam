class AddIndexToUsersUserEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :user_email, unique: true
  end
end
