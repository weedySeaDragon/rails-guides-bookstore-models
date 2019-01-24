class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamp :date_submitted
      t.belongs_to :customer, foreign_key: true
      t.integer :status, null: false

      t.decimal :subtotal, precision: 10, scale: 2, default: 0.00, null: false
      t.decimal :shipping, precision: 10, scale: 2, default: 0.00, null: false
      t.decimal :tax, precision: 10, scale: 2, default: 0.00, null: false
      t.decimal :total, precision: 12, scale: 2, default: 0.00, null: false

      t.timestamps
    end
  end
end
