class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname , presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  validates :password ,presence: true , confirmation: true , length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX, message: "is invalid" }
end
