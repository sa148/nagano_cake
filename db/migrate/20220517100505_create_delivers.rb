class CreateDelivers < ActiveRecord::Migration[6.1]
  def change
    create_table :delivers do |t|
      t.integer :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.timestamps
    end
  end
end
