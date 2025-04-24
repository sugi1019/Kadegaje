class Genre < ApplicationRecord
  
  # ジャンルアイコン
  has_one_attached :genres_image

  has_many :reviews, dependent: :destroy

  validates :name,
            :additional_info,
            :genres_image,
            presence: true


  # Ransackの検索許可
  def self.ransackable_attributes(auth_object = nil)
    ["name"] 
  end

  # Ransackのアソシエーション
  def self.ransackable_associations(auth_object = nil)
    ["reviews"]
  end
end