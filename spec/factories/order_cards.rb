FactoryBot.define do
  factory :order_card do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '大阪市' }
    address { '難波' }
    building {'難波city'}
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end