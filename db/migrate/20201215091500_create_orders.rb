class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :delivery_price, null: false, default: 800
      t.integer :charge, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
