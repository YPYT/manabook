class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_one :order, dependent: :destroy
  has_many_attached :list_images, dependent: :destroy
  
  validates :title,  length: { in: 1..50 }
  validates :description,  length: { in: 1..1000 }
  validates :condition, presence: true
  validates :price, presence: true


  enum condition: {
    new_or_unused: 1,
    minimal_wear: 2,
    moderate_damage: 3,
    damaged: 4
  }

  
  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  private

  def validate_number_of_files
    return if list_images.length <= FILE_NUMBER_LIMIT
    errors.add(:list_images, "are minimum #{FILE_NUMBER_LIMIT}.")
  end


end
