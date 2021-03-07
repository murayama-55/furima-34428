class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    if @item.user_id == current_user.id || @item.buy != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    unless @item.user == current_user
      if @buy_address.valid?
        pay_item
        @buy_address.save
        redirect_to root_path
      else
        render :index
      end
    else
      redirect_to item_path(@item.id)
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
