FactoryBot.define do
  factory :transaction do
    credit_card_number { "#{rand(1000000000000000...9999999999999999)}" }
    credit_card_expiration_date { "2018-10-02" }
    result { "success" }
    invoice { create(:invoice) }
    created_at { "2018-10-27 12:54:00 UTC" }
    updated_at { "2018-10-28 12:55:00 UTC" }
  end
end
