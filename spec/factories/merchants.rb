FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
    created_at { "2018-10-27 12:54:00" }
    updated_at { "2018-10-27 12:55:00" }
  end
end
