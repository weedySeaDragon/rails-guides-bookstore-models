class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year_published
      t.string :isbn
      t.float :price, default: 0, null: false

      t.boolean :out_of_print, default: false

      t.integer :views

      t.belongs_to :author, foreign_key: true, index: true
      t.belongs_to :supplier, foreign_key: true, index: true

      t.timestamps
    end
  end
end
