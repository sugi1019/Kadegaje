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

  # 新規レビュー作成直後に実行
  after_create :reviews_image_default

  # Ransackの検索許可
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "genre_id", "id", "post", "product_name", "rating", "title", "updated_at", "user_id"]
  end

  private

  # 新規作成時に画像がなければデフォルト画像を設定
  def reviews_image_default
    # 画像が存在するか確認
    unless reviews_image.attached?
      reviews_image.attach(
        io: File.open(Rails.root.join("public", "images", "no_image_review.jpg")),
        filename: "no_image_review.jpg",
        content_type: "image/jpeg"
      )
    end
  end

end
