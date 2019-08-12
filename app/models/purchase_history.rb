class PurchaseHistory < ApplicationRecord
  has_many :purchase_details
  belongs_to :end_user
end
