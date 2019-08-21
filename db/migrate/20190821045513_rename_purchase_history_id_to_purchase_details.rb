class RenamePurchaseHistoryIdToPurchaseDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchase_details, :purchase_history_id_id, :purchase_history
  end
end
