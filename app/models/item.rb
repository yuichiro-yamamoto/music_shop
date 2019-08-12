class Item < ApplicationRecord
  has_many :favorites
  has_many :reviews
  has_many :cart_items
  has_many :discs

  belongs_to :genre
  belongs_to :label
  belongs_to :artist
end
