class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 } ,presence: true
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 } ,presence: true
  belongs_to :delivery_fee
  validates :delivery_fee_id, numericality: { other_than: 1 } ,presence: true
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 } ,presence: true
  belongs_to :delivery_day
  validates :delivery_days_id, numericality: { other_than: 1 } ,presence: true

  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :introduce
    validates :price
  end

end
