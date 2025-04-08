class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーアイコン
  has_one_attached :users_image

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  # 表示名は2文字以上必須
  validates :display_name, presence: true, length: {minimum: 2}

end
