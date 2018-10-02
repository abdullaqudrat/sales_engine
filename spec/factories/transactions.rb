FactoryBot.define do
  factory :transaction do
    credit_card_number { "MyString" }
    credit_card_expiration_date { "2018-10-02 10:57:57" }
    result { "MyString" }
    invoice { nil }
  end
end
