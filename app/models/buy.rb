class Buy
  include ActiveModel::Model
  attr_accsessor :user_id, :item_id, :order_id, :post_code, :city, :house_number, :building_name, :phone_number, :prefecture_id



  VALID_POSTCODE_REGEX = ^\d{3}-\d{4}$
  VALID_PHONE_REGEX = /^0\d{10,11}$/

  with_options presence: true do 
    validates :post_code, format: { with: VALID_POSTCODE_REGEX }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
    validates :prefecture_id
  end

  def save
    
  end
end


