class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :introduce, length: {maximum: 1000}
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :delivery_days_id, numericality: { other_than: 1 } 
    validates :price ,numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
