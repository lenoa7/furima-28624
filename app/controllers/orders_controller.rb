class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :redirect_if_own_item
  before_action :redirect_if_sold_out

  def new
    @order = BuyForm.new
  end

  def create
    @order = BuyForm.new(order_params)
    if @order.valid?
      pay_item
      @order.buy_save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:id],token: params[:token])
  end

  def redirect_if_own_item
    redirect_to root_path if @item.user_id == current_user.id
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    ) 
  end

  def redirect_if_sold_out
    redirect_to root_path if Order.find_by(item_id: params[:id]).present?
  end

end
