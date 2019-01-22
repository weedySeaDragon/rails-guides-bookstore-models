class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamp :date_submitted
      t.belongs_to :customer
      t.integer :status

      t.float :subtotal
      t.float :shipping
      t.float :tax
      t.float :total

      t.timestamps
    end
  end
end
