require "rails_helper"

describe "Inovice_items API" do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(5)
  end
  it "sends an invoice_item" do
    invoice_item_1 = create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item_1.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(invoice_item_1.id)
  end
end
