class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :item_status, null: true
      t.timestamps
    end
  end
end
