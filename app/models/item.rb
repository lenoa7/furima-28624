class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user

  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :introduce, length: {maximum: 1000}
    validates :category_id, numericality: { other_than: 1, message: "Select" }
    validates :condition_id, numericality: { other_than: 1, message: "Select" }
    validates :delivery_fee_id, numericality: { other_than: 1, message: "Select" }
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :delivery_days_id, numericality: { other_than: 1, message: "Select" }
    validates :price ,format: { with: VALID_PRICE_REGEX }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
end
