class RenamePurchaseHistoryToPurchaseDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchase_details, :purchase_history, :purchase_history_id
  end
end
