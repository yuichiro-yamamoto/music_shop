class Disc < ApplicationRecord
  has_many :music

  belongs_to :item
end
