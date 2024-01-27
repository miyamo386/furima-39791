FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { 11122223333 }
  end
end
