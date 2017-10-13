class ChangeFieldTypesBooks < ActiveRecord::Migration[5.1]
  def change
    change_column(:books, :isbn, :string)
    change_column(:books, :title, :string)
  end
end
