class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.integer :visits, default: 0, null: false

      t.integer :orders_count, default: 0, null: false

      t.integer :lock_version

      t.timestamps
    end
  end
end
