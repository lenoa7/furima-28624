class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:id])
  end

  def create
    order = Order.create(order_params)
    if order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:image,:name,:introduce,:category_id,:condition_id,:delivery_fee_id,:delivery_days_id,:price,:prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
