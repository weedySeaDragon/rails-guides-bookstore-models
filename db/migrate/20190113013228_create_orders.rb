class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamp :date_submitted
      t.belongs_to :customer
      t.integer :status, null: false

      t.decimal :subtotal, default: 0.00, null: false
      t.decimal :shipping, default: 0.00, null: false
      t.decimal :tax, default: 0.00, null: false
      t.decimal :total, default: 0.00, null: false

      t.timestamps
    end
  end
end
