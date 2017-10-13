class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :isbn
      t.text :title

      t.timestamps
    end
  end
end
