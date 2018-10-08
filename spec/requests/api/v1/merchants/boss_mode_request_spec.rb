require "rails_helper"

describe "Merchants API" do
  it "can get customers with pending invoices for merchant"  do
    merchant = create(:merchant)
    c_1, c_2 = create_list(:customer, 2)
    in_5 = create(:invoice, merchant: merchant, customer: c_2)
    in_6 = create(:invoice, merchant: merchant, customer: c_1)
    t_1 = create(:transaction, invoice: in_5, result: "failed")
    t_2 = create(:transaction, invoice: in_6)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers[0]["id"]).to eq(c_2.id)
  end
end
