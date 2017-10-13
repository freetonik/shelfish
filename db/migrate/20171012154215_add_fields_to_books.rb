class AddFieldsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :author, :string
    add_column :books, :date, :date
    add_column :books, :comment, :text
    add_reference :books, :user, foreign_key: true
  end
end
