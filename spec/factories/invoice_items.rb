FactoryBot.define do
  factory :invoice_item do
    quantity { rand(1..10) }
    unit_price { Faker::Commerce.price }
    item { nil }
    invoice { nil }
    created_at { '2018-09-01 12:00:00 UTC'}
    updated_at { '2018-09-01 12:00:00 UTC'}
  end
end
