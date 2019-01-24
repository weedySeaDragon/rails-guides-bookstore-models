class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body
      t.integer :rating, null: false

      t.integer :state, default: 0

      t.belongs_to :customer, foreign_key: true, index: true
      t.belongs_to :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
