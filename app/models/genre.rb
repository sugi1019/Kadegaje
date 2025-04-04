class Genre < ApplicationRecord
  
  # ジャンルアイコン
  has_one_attached :genres_image

  has_many :reviews, dependent: :destroy

  validates :genre, presence: true
end
