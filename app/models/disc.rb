class Disc < ApplicationRecord
  has_many :musics

  belongs_to :item
end
