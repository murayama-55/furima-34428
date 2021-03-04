class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC ")
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(
      :item_name, :info, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :schedule_id, :image).merge(
        user_id: current_user.id)
  end
  
end