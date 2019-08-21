class PurchaseDetail < ApplicationRecord
  belongs_to :purchase_history

  enum shipping_status: { "受付": 0, "準備中": 1, "発注済": 2 }
  enum method_of_payment: { "代金引換": 0, "銀行振込": 1, "クレジットカード": 2 }
end
