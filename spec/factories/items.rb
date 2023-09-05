FactoryBot.define do
  factory :item do
    item_name               {'箱'}
    description             {'入れ物'}
    price                   {'5000'}
    category_id             {'2'}
    condition_id            {'2'}
    shipping_charge_id      {'2'}
    prefecture_id           {'2'}
    days_to_ship_id         {'2'}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
