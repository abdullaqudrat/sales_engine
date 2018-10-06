require "rails_helper"

describe "Merchants API" do
  it "can get items associated with merchant" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(5)
  end
  it "can get invoices associated with merchant" do
    merchant = create(:merchant)
    c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
    create(:invoice, merchant: merchant, customer: c_1)
    create(:invoice, merchant: merchant, customer: c_2)
    create(:invoice, merchant: merchant, customer: c_3)
    create(:invoice, merchant: merchant, customer: c_4)
    create(:invoice, merchant: merchant, customer: c_5)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(5)
  end
end
