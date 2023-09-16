FactoryBot.define do
  factory :purchase_address do
    postal_code {'123-4567'}
    prefecture_id { 2 }
    city {'千葉県'}
    street_address {1-1}
    building_name {'東京ドイツ'}
    telephone_number {'09065434567'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
