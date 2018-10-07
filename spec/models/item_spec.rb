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
        create(:invoice_item, item: item_1, invoice: invoice_2)
        create(:invoice_item, item: item_1, invoice: invoice_3)
        create(:invoice_item, item: item_2, invoice: invoice_4)
        create(:invoice_item, item: item_2, invoice: invoice_4)
        create(:invoice_item, item: item_3, invoice: invoice_1)
        create(:invoice_item, item: item_3, invoice: invoice_1)

        expect(Item.most_revenue).to eq([item_3, item_1, item_2])
        expect(Item.most_revenue(2)).to eq([item_3, item_1])
      end
    end
  end
end
