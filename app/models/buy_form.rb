class BuyForm
  include ActiveModel::Model
  include ActiveModel::AttributeMethods

  attr_accessor :user_id, :item_id, :order_id, :post_code, :city, :house_number, :building_name, :phone_number, :prefecture_id, :card_number, :card_month, :card_year, :security_code, :token

  VALID_POST_REGEX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_REGEX = /\A\d{10,11}\z/

  with_options presence: true do 
    validates :card_number
    validates :card_year
    validates :card_month
    validates :security_code
    validates :post_code, format: { with: VALID_POST_REGEX }
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" } 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
  end

  def buy_save
    ActiveRecord::Base.transaction do
      order = Order.create!( user_id: user_id, item_id: item_id)
      Address.new(order_id: order.id, post_code: post_code, city: city, house_number: house_number, phone_number: phone_number, prefecture_id: prefecture_id).save!
    rescue 
      false
    end
  end
end


