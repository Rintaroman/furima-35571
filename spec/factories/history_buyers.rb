FactoryBot.define do
  factory :history_buyer do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '1234567890' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
