class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture, :city, :address, :building, :phone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code
    validates :city
    validates :address
    validates :phone
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    @buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
       address: address, building: building, phone: phone, buy_id: buy_id)
  end

end