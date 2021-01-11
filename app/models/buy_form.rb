class BuyForm
  include ActiveModel::Model
  include ActiveModel::AttributeMethods
  
  attr_accessor :user_id, :item_id, :order_id, :post_code, :city, :house_number, :building_name, :phone_number, :prefecture_id

  with_options presence: true do 
    validates :post_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" } 
  end

  def buy_save
    ActiveRecord::Base.transaction do
      Order.new(user_id: user_id, item_id: item_id).save!
      Address.new(post_code: post_code, city: city, house_number: house_number, phone_number: phone_number, prefecture_id: prefecture_id).save!
    rescue 
      false
    end
  end
end


