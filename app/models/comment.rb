class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :comment, length: {maximum: 1000}
end
