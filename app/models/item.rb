class Item < ApplicationRecord
  has_many :favorites
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :discs, dependent: :destroy

  belongs_to :genre
  belongs_to :label
  belongs_to :artist

  attachment :item_image
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  enum sale_condition: { "販売中": 0, "販売停止中": 1 }
  def favorited_by?(end_user)
      favorites.where(end_user_id: end_user.id).exists?
  end
end
