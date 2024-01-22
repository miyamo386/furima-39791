FactoryBot.define do
  factory :item do
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name { '三色ボールペン' }
    item_description { '赤・青・黒インクの発色が良く書き味がサラサラして書きやすいです' }
    price { '500' }
    category_id { 2 }
    item_status_id { 2 }
    delivery_price_id { 2 }
    prefecture_id { 2 }
    delivery_criterion_id { 2 }
  end
end
