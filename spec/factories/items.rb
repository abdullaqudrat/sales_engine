FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Hacker.say_something_smart }
    unit_price { Faker::Commerce.price }
    merchant { create(:merchant) }
  end
end
