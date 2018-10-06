require "rails_helper"

describe "Inovices API" do
  it "sends a list of invoices" do
    create_list(:invoice, 5)

    get "/api/v1/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(5)
  end
  it "sends an invoice" do
    invoice_1 = create(:invoice)

    get "/api/v1/invoices/#{invoice_1.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
