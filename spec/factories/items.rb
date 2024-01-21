FactoryBot.define do
  factory :item do
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name { '三色ボールペン' }
    item_description { '赤・青・黒インクの発色が良く書き味がサラサラして書きやすいです' }
    price { '500' }
    category { Category.all.sample }
    item_status { ItemStatus.all.sample }
    delivery_price { DeliveryPrice.all.sample }
    prefecture { Prefecture.all.sample }
    delivery_criterion { DeliveryCriterion.all.sample }
  end
end
