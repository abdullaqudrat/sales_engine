require "rails_helper"

describe "Invoice_items API" do
  it "can send items associated with the invoice_item" do
    item_1 = create(:item)
    create(:item)
    invoice_item = create(:invoice_item, item: item_1)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(Item.all.count).to eq(2)
    expect(item["id"]).to eq(item_1.id)
  end
  it "can send invoices associated with the invoice_item" do
    invoice_1 = create(:invoice)
    create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice_1)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(Invoice.all.count).to eq(2)
    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
