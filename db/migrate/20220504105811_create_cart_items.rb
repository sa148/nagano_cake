class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item, null: false
      t.integer :customer, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
