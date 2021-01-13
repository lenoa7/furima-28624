class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :correct_order_user

  def new
    @order = BuyForm.new
  end

  def create
    @order = BuyForm.new(order_params)
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

  def correct_order_user
    redirect_to root_path if current_user.id == @item.user_id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
