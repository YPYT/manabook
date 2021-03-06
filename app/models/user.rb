class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :listings, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order"

  has_one_attached :profile_image, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, on: :create, format: { with: VALID_PASSWORD_REGEX, message: "must contain both single-byte alphanumeric characters"}
  validates :password, confirmation: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
