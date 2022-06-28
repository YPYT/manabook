class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :listing
  validates :comment, length: {maximum: 500, message: "Your comment is too long."}
end
