class Review < ApplicationRecord
  
  # 製品画像
  has_one_attached :reviews_image

  belongs_to :user
  belongs_to :genre

  has_many :comments, dependent: :destroy

  validates :user,
            :genre,
            :title,
            :rating,
            :post,
            :product_name,
            presence: true
end
