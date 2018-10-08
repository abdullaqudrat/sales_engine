require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
  end
  describe 'Relationships' do
    it {should have_many(:invoices)}
  end
  describe 'Class Methods' do
    describe '::favorite_merchant' do
      it 'should return customers favorite_merchant' do
        customer_1 = create(:customer)
        merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
        invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, customer: customer_1, merchant: merchant_1)
        invoice_4, invoice_5 = create_list(:invoice, 2, customer: customer_1, merchant: merchant_2)
        invoice_6 = create(:invoice, customer: customer_1, merchant: merchant_3)
        create(:transaction, invoice: invoice_1)
        create(:transaction, invoice: invoice_2, result: "failed")
        create(:transaction, invoice: invoice_3, result: "failed")
        create(:transaction, invoice: invoice_4, result: "failed")
        create(:transaction, invoice: invoice_4)
        create(:transaction, invoice: invoice_5)
        create(:transaction, invoice: invoice_6, result: "failed")

        expect(Customer.favorite_merchant(customer_1.id)).to eq(merchant_2)
      end
    end
  end
end
