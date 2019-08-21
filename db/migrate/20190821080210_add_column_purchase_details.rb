class AddColumnPurchaseDetails < ActiveRecord::Migration[5.2]
  def up
    add_column :purchase_details,:method_of_payment,:integer
    add_column :purchase_details,:item_image_id,:string
  end
  def down
    remove_column :purchase_details,:method_of_payment,:integer
    remove_column :purchase_details,:item_image_id,:string
  end
end
