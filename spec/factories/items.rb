FactoryBot.define do
  factory :item do

    item_name         {Faker::Base.regexify("[aあ]{5}")}
    info              {Faker::Base.regexify("[aあ]{20}")}
    price             {rand(300..9999999)}
    category_id       {rand(2..11)}
    sales_status_id   {rand(2..7)}
    shipping_fee_id   {rand(2..3)}
    prefecture_id     {rand(2..48)}
    schedule_id       {rand(2..4)}
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/00.jpg'), filename: '00.jpg')
    end
    
  end
end