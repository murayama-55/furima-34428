class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    #binding.pry
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:hoge, :post_code, :prefecture_id, :city, :address, :building, :phone).merge(item_id: params[:item_id])
  end

end
