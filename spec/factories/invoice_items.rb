FactoryBot.define do
  factory :invoice_item do
    quantity { rand(1..10) }
    unit_price { Faker::Commerce.price }
    item { nil }
    invoice { nil }
  end
end
