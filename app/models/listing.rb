class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :list_images, dependent: :destroy
  
  validates :title,  length: { in: 1..50 }
  validates :description,  length: { in: 1..1000 }
  validates :condition, presence: true


  enum condition: {
    new_or_unused: 1,
    not_much_damege: 2,
    a_little_damage: 3,
    much_damage: 4
  }

  
  FILE_NUMBER_LIMIT = 4

  validate :validate_number_of_files

  private

  def validate_number_of_files
    return if list_images.length <= FILE_NUMBER_LIMIT
    errors.add(:list_images, "are minimum #{FILE_NUMBER_LIMIT}.")
  end


end
