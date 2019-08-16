class Disc < ApplicationRecord
<<<<<<< HEAD
  has_many :musics
=======
  has_many :musics, dependent: :destroy
>>>>>>> abc/develop

  belongs_to :item

  accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
end
