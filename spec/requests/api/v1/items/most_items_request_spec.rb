require "rails_helper"

describe 'Items API' do
  it 'can send x items ranked by most sold' do
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

    quantity = 1

    get "/api/v1/items/most_items?quantity=#{quantity}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(Item.count).to eq(3)
    expect(items.count).to eq(1)
    expect(items["id"]).to eq(item_1.id)

    get "/api/v1/items/most_items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(Item.count).to eq(3)
    expect(items.count).to eq(2)
    expect(items[0]["id"]).to eq(item_1.id)
    expect(items[1]["id"]).to eq(item_3.id)
  end
end
