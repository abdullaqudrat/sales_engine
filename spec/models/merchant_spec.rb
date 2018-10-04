require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
  describe 'Relationships' do
    it {should have_many(:invoices)}
  end
  describe 'Class Methods' do
    describe '::most_revenue' do
      it 'should return X top ranked merchants by revenue' do
        m_1, m_2, m_3, m_4, m_5 = create_list(:merchant, 5)
        c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
        i_1 = create(:item, unit_price: 9000, merchant: m_3)
        i_2 = create(:item, unit_price: 5000, merchant: m_1)
        i_3 = create(:item, unit_price: 1000, merchant: m_5)
        i_4 = create(:item, unit_price: 1500, merchant: m_2)
        i_5 = create(:item, unit_price: 9999, merchant: m_4)
        in_1 = create(:invoice, merchant: m_3, customer: c_1)
        in_2 = create(:invoice, merchant: m_1, customer: c_2)
        in_3 = create(:invoice, merchant: m_5, customer: c_3)
        in_4 = create(:invoice, merchant: m_2, customer: c_4)
        in_5 = create(:invoice, merchant: m_4, customer: c_5, status: "cancelled")
        create(:transaction, invoice: in_1)
        create(:transaction, invoice: in_2)
        create(:transaction, invoice: in_3)
        create(:transaction, invoice: in_4)
        create(:transaction, invoice: in_5, result: "failed")
        create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
        create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
        create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
        create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
        create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

        expect(Merchant.most_revenue(3)).to eq([m_3, m_1, m_5])
      end
    end
    describe '::most_items' do
      it 'should return X top ranked merchants by items sold' do
        m_1, m_2, m_3, m_4, m_5 = create_list(:merchant, 5)
        c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
        i_1 = create(:item, unit_price: 9000, merchant: m_3)
        i_2 = create(:item, unit_price: 5000, merchant: m_1)
        i_3 = create(:item, unit_price: 1000, merchant: m_5)
        i_4 = create(:item, unit_price: 1500, merchant: m_2)
        i_5 = create(:item, unit_price: 9999, merchant: m_4)
        in_1 = create(:invoice, merchant: m_3, customer: c_1, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_2 = create(:invoice, merchant: m_1, customer: c_2, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_3 = create(:invoice, merchant: m_5, customer: c_3, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_4 = create(:invoice, merchant: m_2, customer: c_4, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_5 = create(:invoice, merchant: m_4, customer: c_5, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00", status: "cancelled")
        create(:transaction, invoice: in_1)
        create(:transaction, invoice: in_2)
        create(:transaction, invoice: in_3)
        create(:transaction, invoice: in_4)
        create(:transaction, invoice: in_5, result: "failed")
        create(:invoice_item, item: i_1, invoice: in_1, quantity: 3, unit_price: i_1.unit_price)
        create(:invoice_item, item: i_2, invoice: in_2, quantity: 4, unit_price: i_2.unit_price)
        create(:invoice_item, item: i_3, invoice: in_3, quantity: 5, unit_price: i_3.unit_price)
        create(:invoice_item, item: i_4, invoice: in_4, quantity: 2, unit_price: i_4.unit_price)
        create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

        expect(Merchant.most_items_sold(3)).to eq([m_5, m_1, m_3])
      end
    end
    describe '::all_revenue_by_date' do
      it 'should return X top ranked merchants by revenue' do
        m_1, m_2, m_3, m_4, m_5 = create_list(:merchant, 5)
        c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
        i_1 = create(:item, unit_price: 9000, merchant: m_3)
        i_2 = create(:item, unit_price: 5000, merchant: m_1)
        i_3 = create(:item, unit_price: 1000, merchant: m_5)
        i_4 = create(:item, unit_price: 1500, merchant: m_2)
        i_5 = create(:item, unit_price: 9999, merchant: m_4)
        in_1 = create(:invoice, merchant: m_3, customer: c_1, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_2 = create(:invoice, merchant: m_1, customer: c_2, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_3 = create(:invoice, merchant: m_5, customer: c_3, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_4 = create(:invoice, merchant: m_2, customer: c_4, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_5 = create(:invoice, merchant: m_4, customer: c_5, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00", status: "cancelled")
        create(:transaction, invoice: in_1)
        create(:transaction, invoice: in_2)
        create(:transaction, invoice: in_3)
        create(:transaction, invoice: in_4)
        create(:transaction, invoice: in_5, result: "failed")
        create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
        create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
        create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
        create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
        create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

        expect(Merchant.all_revenue_by_date("2018-10-27 12:54:00")).to eq(20000)
        expect(Merchant.all_revenue_by_date("2018-10-28 12:54:00")).to eq(11500)
      end
    end
  end
  describe 'instance methods' do
    describe '#total_revenue' do
      it 'should return total revenue for merchant' do
        merchant = create(:merchant)
        c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
        i_1 = create(:item, unit_price: 9000, merchant: merchant)
        i_2 = create(:item, unit_price: 5000, merchant: merchant)
        i_3 = create(:item, unit_price: 1000, merchant: merchant)
        i_4 = create(:item, unit_price: 1500, merchant: merchant)
        i_5 = create(:item, unit_price: 9999, merchant: merchant)
        in_1 = create(:invoice, merchant: merchant, customer: c_1)
        in_2 = create(:invoice, merchant: merchant, customer: c_2)
        in_3 = create(:invoice, merchant: merchant, customer: c_3)
        in_4 = create(:invoice, merchant: merchant, customer: c_4)
        in_5 = create(:invoice, merchant: merchant, customer: c_5, status: "cancelled")
        create(:transaction, invoice: in_1)
        create(:transaction, invoice: in_2)
        create(:transaction, invoice: in_3)
        create(:transaction, invoice: in_4)
        create(:transaction, invoice: in_5, result: "failed")
        create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
        create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
        create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
        create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
        create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

        expect(merchant.total_revenue).to eq(31500)
      end
    end
    describe '#total_revenue_by_date' do
      it 'should return total revenue by date for merchant' do
        merchant = create(:merchant)
        c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
        i_1 = create(:item, unit_price: 9000, merchant: merchant)
        i_2 = create(:item, unit_price: 5000, merchant: merchant)
        i_3 = create(:item, unit_price: 1000, merchant: merchant)
        i_4 = create(:item, unit_price: 1500, merchant: merchant)
        i_5 = create(:item, unit_price: 9999, merchant: merchant)
        in_1 = create(:invoice, merchant: merchant, customer: c_1, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_2 = create(:invoice, merchant: merchant, customer: c_2, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_3 = create(:invoice, merchant: merchant, customer: c_3, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00")
        in_4 = create(:invoice, merchant: merchant, customer: c_4, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-28 12:54:00")
        in_5 = create(:invoice, merchant: merchant, customer: c_5, created_at: "2018-10-26 11:54:00", updated_at: "2018-10-27 12:54:00", status: "cancelled")
        create(:transaction, invoice: in_1)
        create(:transaction, invoice: in_2)
        create(:transaction, invoice: in_3)
        create(:transaction, invoice: in_4)
        create(:transaction, invoice: in_5, result: "failed")
        create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
        create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
        create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
        create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
        create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

        expect(merchant.total_revenue_by_date("2018-10-27 12:54:00")).to eq(20000)
        expect(merchant.total_revenue_by_date("2018-10-28 12:54:00")).to eq(11500)
      end
    end
  end
end
