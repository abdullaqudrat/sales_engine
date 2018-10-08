require "rails_helper"

describe 'Items API' do
  it 'can send highest sales date for item' do
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
    create(:invoice_item, item: item_1, invoice: invoice_2, quantity: 9)
    create(:invoice_item, item: item_1, invoice: invoice_1, quantity: 1)

    get "/api/v1/items/#{item_1.id}/best_day"

    expect(response).to be_successful

    date = JSON.parse(response.body)

    expect(date["best_day"]).to eq("2018-09-03T12:00:00.000Z")
  end
end
