class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.find(params[:id])
    @order = BuyForm.new
  end

  def create
    @order = BuyForm.new(order_params)
    @item = Item.find(params[:id])
    if @order.valid? && @order.buy_save
       redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:id])
  end
end
