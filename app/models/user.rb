class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  # ユーザーアイコン
  has_one_attached :users_image

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 表示名は2文字以上必須
  validates :display_name, presence: true, length: {minimum: 2}

  # 新規作成直後に実行
  after_create :users_image_default

  # Ransackの検索許可
  def self.ransackable_attributes(auth_object = nil)
    ["display_name","email"]
  end

  # ゲストログイン用
  GUEST_USER_EMAIL = "guest@example.com"
  # ゲストユーザーがなければ作成
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      # SecureRandom.urlsafe_base64 で＋や／を含まない安全な乱数を作成
      user.password = SecureRandom.urlsafe_base64
      user.display_name = "guest-user"
    end
  end
  # ゲストユーザーを判断 (current_user.guest?)の様に使う
  def guest?
    email == 'guest@example.com'
  end


  private

  # 新規作成時にデフォルトアイコンを設定
  def users_image_default
    # 画像が存在するか確認
    unless users_image.attached?
      users_image.attach(
        io: File.open(Rails.root.join("public", "images", "no_image.jpg")),
        filename: "no_image.jpg",
        content_type: "image/jpeg"
      )
    end
  end
end
