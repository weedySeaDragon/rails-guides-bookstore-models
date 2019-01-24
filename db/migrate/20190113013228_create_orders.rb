class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamp :date_submitted
      t.belongs_to :customer
      t.integer :status, null: false

      t.double :subtotal, default: 0.00, null: false
      t.double :shipping, default: 0.00, null: false
      t.double :tax, default: 0.00, null: false
      t.double :total, default: 0.00, null: false

      t.timestamps
    end
  end
end
