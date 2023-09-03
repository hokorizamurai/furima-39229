FactoryBot.define do
  factory :item do
    item_name               {'箱'}
    image                   {Faker::Lorem.sentence}
    description             {'入れ物'}
    price                   {'5000'}
    category_id             {'2'}
    condition_id            {'2'}
    shipping_charge_id      {'2'}
    prefecture_id           {'2'}
    days_to_ship_id         {'2'}
    association :user
  end
end
