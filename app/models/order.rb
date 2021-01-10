class Order < ApplicationRecord

  VALID_POSTCODE_REGEX = ^\d{3}-\d{4}$
  VALID_PHONE_REGEX = /^0\d{10,11}$/

  with_options presence: true do 
    validates :post_code, format: { with: VALID_POSTCODE_REGEX }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :prefecture_id
  end
end

