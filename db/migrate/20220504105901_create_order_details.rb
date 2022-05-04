class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order, null: false
      t.integer :item, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false
      t.timestamps
    end
  end
end