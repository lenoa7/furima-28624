class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email , format: { with: VALID_EMAIL_REGEX }
    VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
    validates :password , confirmation: true , length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX, message: "is invalid" }
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name ,format: { with: VALID_NAME_REGEX, message: "is invalid" }
    validates :last_name,format: { with: VALID_NAME_REGEX, message: "is invalid" }
    validates :first_name_kana,format: { with: VALID_NAME_REGEX, message: "is invalid" }
    validates :last_name_kana,format: { with: VALID_NAME_REGEX, message: "is invalid" }
    validates :birth_date
  end
end
