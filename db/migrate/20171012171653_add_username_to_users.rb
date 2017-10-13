class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nickname
    add_column :users, :nickname, :string
    add_index :users, :nickname, unique: true
  end
end
