class Address < ApplicationRecord
  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :prefecture

  #with_options presence: true do
    #validates :post_code
    #validates :city
    #validates :address
    #validates :phone
    #with_options numericality: { other_than: 1 } do
      #validates :prefecture_id
    #end
  #end

  belongs_to :buy

end