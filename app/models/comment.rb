class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :listing, dependent: :destroy
  validates :comment, length: {maximum: 1000}
end
