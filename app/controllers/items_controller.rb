class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :item_find, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:introduce,:category_id,:condition_id,:delivery_fee_id,:delivery_days_id,:price,:prefecture_id).merge(user_id: current_user.id)
  end

  def correct_user
    redirect_to root_path if current_user.id != @item.user_id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
