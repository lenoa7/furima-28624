class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parmas)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_parmas
    parmas.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
