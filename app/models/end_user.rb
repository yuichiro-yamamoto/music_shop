class EndUser < ApplicationRecord
  has_many :purchase_histories
  has_many :addresses
  has_many :favorites
  has_many :reviews
  has_many :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
