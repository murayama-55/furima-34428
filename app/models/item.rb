class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :info
    validates :price
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_id
  end

  belongs_to :user
  
end
