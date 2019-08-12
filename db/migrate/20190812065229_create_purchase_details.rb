class CreatePurchaseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_details do |t|
      t.references :purchase_history_id, null: false, foreign_key: true

      #enum
      t.integer :shipping_status, null: false

      t.integer :sale_number, null: false
      t.integer :price_history, null: false

      t.string :item_name_history, null: false
      t.string :artist_name_history, null: false
      t.string :postal_code_history, null: false
      t.string :address_history, null: false
      t.string :telephone_number_history, null: false
      t.string :name_history, null: false

      t.timestamps
    end
  end
end
