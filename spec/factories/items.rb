FactoryBot.define do
  factory :item do
    image                  {Faker::Lorem.sentence}
    name                   {"test"}
    info                   {Faker::Lorem.sentence}
    category_id            {Faker::Number.between(from: 2, to: 11)}
    sales_status_id        {Faker::Number.between(from: 2, to: 8)}
    shipping_fee_status_id {Faker::Number.between(from: 2, to: 4)}
    prefecture_id          {Faker::Number.between(from: 2, to: 48)}
    scheduled_delivery_id  {Faker::Number.between(from: 2, to: 5)}
    price                  {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
