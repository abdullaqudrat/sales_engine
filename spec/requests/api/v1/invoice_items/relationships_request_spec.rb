require "rails_helper"

describe "Invoice_items API" do
  it "can send item associated with the invoice_item" do
    item_1 = create(:item)
    invoice_item = create(:invoice_item, item: item_1)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
  end
  it "can send invoice associated with the invoice_item" do
    invoice_1 = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice_1)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
