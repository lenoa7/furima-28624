class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :introduce
    validates :category_id
    validates :condition_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_days_id
    validates :price
  end
end
