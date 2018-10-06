FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
    created_at { "2018-10-27 12:54:00 UTC" }
    updated_at { "2018-10-27 12:55:00 UTC" }
  end
end
