class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  def index
    @item = Item.all.order(created_at: :desc).includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:introduce,:category_id,:condition_id,:delivery_fee_id,:delivery_days_id,:price,:prefecture_id).merge(user_id: current_user.id)
  end
end
