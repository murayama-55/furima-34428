class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :index
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name, :info, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :schedule_id, :image).merge(
        user_id: current_user.id)
  end
  
end