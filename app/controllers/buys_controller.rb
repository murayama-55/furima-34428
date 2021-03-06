class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    # binding.pry
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private
  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

end
