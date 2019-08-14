class Disc < ApplicationRecord
  has_many :musics, dependent: :destroy

  belongs_to :item

  accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
end
