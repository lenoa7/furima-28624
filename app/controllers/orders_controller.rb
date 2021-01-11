class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:id])
  end

  def create
    @order = BuyForm.new(order_params)
    @item = Item.find(params[:id])
    if @order.buy_save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
