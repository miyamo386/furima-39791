FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { 11_122_223_333 }
  end
end
