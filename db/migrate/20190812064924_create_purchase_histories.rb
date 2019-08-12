class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.references :end_user, null: false, foreign_key: true

      t.integer :total_price, null: false
      t.integer :shipping_charge, null: false
      t.integer :consumption_tax, null: false

      t.timestamps
    end
  end
end
