FactoryBot.define do
  factory :item do

    item_name         {Faker::Base.regexify("[aあ]{5}")}
    info              {Faker::Base.regexify("[aあ]{20}")}
    price             {rand(300..9999999)}
    category_id       {'2'}
    sales_status_id   {'2'}
    shipping_fee_id   {'2'}
    prefecture_id     {'2'}
    schedule_id       {'2'}
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/00.jpg'), filename: '00.jpg')
    end
    
  end
end