class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :end_user, null: false, foreign_key: true

      t.integer :purchase_quantity, null: false, default: 1

      t.timestamps
    end
  end
end
