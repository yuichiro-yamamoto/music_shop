class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.string :item_name, null: false, index: true
      t.string :item_image_id, null: false
      t.integer :price, null: false
      t.integer :stock, null: false
      t.integer :sale_number, null: false

      #enumを使用する要素
      t.integer :sale_condition, null: false

      t.timestamps null: false
    end
  end
end
