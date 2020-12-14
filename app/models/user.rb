class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname , presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , presence: true , format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :encrypted_password ,presence: true , confirmation: true , length: {minimum: 6},format: { with: VALID_PASSWORD_REGEX }
end
