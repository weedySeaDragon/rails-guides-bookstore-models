class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :year_published
      t.string :isbn
      t.double :price, default: 0, null: false

      t.boolean :out_of_print, default: false

      t.integer :views, default: 0, null: false

      t.belongs_to :author, foreign_key: true, index: true
      t.belongs_to :supplier, foreign_key: true, index: true

      t.timestamps
    end
  end
end
