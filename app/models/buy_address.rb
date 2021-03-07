class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    @buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
       address: address, building: building, phone: phone, buy_id: @buy.id)
  end

end