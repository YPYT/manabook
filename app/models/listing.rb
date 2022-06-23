class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  enum condition: {
    new_or_unused: 1,
    not_much_damege: 2,
    a_little_damage: 3,
    much_damage: 4,
  }

end
