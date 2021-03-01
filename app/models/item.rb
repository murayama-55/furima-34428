class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule

  with_options presence: true do
    validates :image
    validates :item_name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {
      only_integer: true, greater_than: 299, less_than: 10000000
      }
    validates :category_id, numericality: { other_than: 1 } 
    validates :sales_status_id, numericality: { other_than: 1 } 
    validates :shipping_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :schedule_id, numericality: { other_than: 1 } 
  end

  belongs_to :user
  has_one_attached :image
  
end
