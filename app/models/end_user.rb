class EndUser < ApplicationRecord
  has_many :purchase_histories, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  enum usually_payment: { "代金引換": 0, "銀行振込": 1, "クレジットカード": 2 }

  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
