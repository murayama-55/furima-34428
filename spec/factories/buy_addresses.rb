FactoryBot.define do
  factory :buy_address do

    token {"tok_abcdefghijk00000000000000000"}
    post_code         { '123-4567' }
    prefecture_id     { 2 }
    city              { '東京都' }
    address           { '１−１' }
    building          { '東京ハイツ' }
    phone             { '09012345678' }
  end

end