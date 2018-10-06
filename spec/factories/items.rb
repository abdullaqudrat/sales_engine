FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Hacker.say_something_smart }
    unit_price { Faker::Commerce.price }
    merchant { create(:merchant) }
    created_at { '2018-09-01 12:00:00 UTC'}
    updated_at { '2018-09-01 12:00:00 UTC'}
  end
end
