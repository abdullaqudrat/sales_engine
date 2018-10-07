require "rails_helper"

describe "Items API" do
    it "can send invoice_items associated with the item" do
    item = create(:item)
    create_list(:invoice_item, 5, item: item)
    create(:invoice_item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(InvoiceItem.all.count).to eq(6)
    expect(invoice_items.count).to eq(5)
  end
  it "can send merchant associated with the item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    merchants = [JSON.parse(response.body)]

    expect(Merchant.all.count).to eq(6)
    expect(merchants.count).to eq(1)
  end
end
