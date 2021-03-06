require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:unit_price)}
  end
  describe 'Relationships' do
    it {should belong_to(:merchant)}
    it {should have_many(:invoices).through(:invoice_items)}
  end
  describe 'Class Methods' do
    describe '::most_revenue' do
      it 'should return x top ranked items by revenue' do
        item_1, item_2, item_3 = create_list(:item, 3)
        invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
        invoice_4 = create(:invoice, status: 'cancelled')
        create(:transaction, invoice: invoice_1)
        create(:transaction, invoice: invoice_2)
        create(:transaction, invoice: invoice_3, result: "failed")
        create(:transaction, invoice: invoice_3)
        create(:transaction, invoice: invoice_4, result: "failed")
        create(:invoice_item, item: item_1, invoice: invoice_2, quantity: 1, unit_price: 10000)
        create(:invoice_item, item: item_1, invoice: invoice_3, quantity: 2, unit_price: 3000)
        create(:invoice_item, item: item_2, invoice: invoice_4, quantity: 15, unit_price: 14000)
        create(:invoice_item, item: item_2, invoice: invoice_4, quantity: 20, unit_price: 15000)
        create(:invoice_item, item: item_3, invoice: invoice_1, quantity: 5, unit_price: 5000)
        create(:invoice_item, item: item_3, invoice: invoice_1, quantity: 3, unit_price: 4000)

        expect(Item.most_revenue).to eq([item_3, item_1])
        expect(Item.most_revenue(1)).to eq([item_3])
      end
    end
    describe '::most_sold' do
      it 'should return x items ranked by most sold' do
        item_1, item_2, item_3 = create_list(:item, 3)
        invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3)
        invoice_4 = create(:invoice, status: 'cancelled')
        create(:transaction, invoice: invoice_1)
        create(:transaction, invoice: invoice_2)
        create(:transaction, invoice: invoice_3, result: "failed")
        create(:transaction, invoice: invoice_3)
        create(:transaction, invoice: invoice_4, result: "failed")
        create(:invoice_item, item: item_1, invoice: invoice_2, quantity: 10, unit_price: 10000)
        create(:invoice_item, item: item_1, invoice: invoice_3, quantity: 20, unit_price: 3000)
        create(:invoice_item, item: item_2, invoice: invoice_4, quantity: 15, unit_price: 14000)
        create(:invoice_item, item: item_2, invoice: invoice_4, quantity: 20, unit_price: 15000)
        create(:invoice_item, item: item_3, invoice: invoice_1, quantity: 1, unit_price: 5000)
        create(:invoice_item, item: item_3, invoice: invoice_1, quantity: 1, unit_price: 4000)

        expect(Item.most_sold).to eq([item_1, item_3])
        expect(Item.most_sold(1)).to eq([item_1])
      end
    end
    describe "best_day" do
      it "should return highest sales date of item" do
        item_1 = create(:item)
        invoice_1 = create(:invoice, created_at: '2018-09-01 12:00:00 UTC')
        invoice_2 = create(:invoice, created_at: '2018-09-02 12:00:00 UTC')
        invoice_3 = create(:invoice, created_at: '2018-09-03 12:00:00 UTC')
        invoice_4 = create(:invoice, status: 'cancelled')
        create(:transaction, invoice: invoice_1)
        create(:transaction, invoice: invoice_2)
        create(:transaction, invoice: invoice_3, result: "failed")
        create(:transaction, invoice: invoice_3)
        create(:transaction, invoice: invoice_4, result: "failed")
        create(:invoice_item, item: item_1, invoice: invoice_2, quantity: 10)
        create(:invoice_item, item: item_1, invoice: invoice_3, quantity: 20)
        create(:invoice_item, item: item_1, invoice: invoice_4, quantity: 100)
        create(:invoice_item, item: item_1, invoice: invoice_2, quantity: 10)
        create(:invoice_item, item: item_1, invoice: invoice_1, quantity: 1)

        expect(Item.best_day(item_1.id)).to eq('2018-09-03 12:00:00.000000000 +0000')
      end
    end
  end
end
