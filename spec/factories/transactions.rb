FactoryBot.define do
  factory :transaction do
    credit_card_number { "#{rand(1000000000000000...9999999999999999)}" }
    credit_card_expiration_date { "2018-10-02" }
    result { "success" }
    invoice { create(:invoice) }
  end
end
