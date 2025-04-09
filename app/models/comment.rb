class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :review

  validates :user,
            :review,
            :post_comment,
            presence: true
end
