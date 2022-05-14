class CreateOredes < ActiveRecord::Migration[6.1]
  def change
    create_table :oredes do |t|
      t.integer :customer, null: false
      t.string :postal_code, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.integer :shipping_fee, null: false
      t.integer :total_payemt, null: false
      t.integer :method_of_paymentder, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
