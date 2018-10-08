require "rails_helper"

describe "Customers API" do
  it "can get favorite_merchant of customer"  do
    customer_1 = create(:customer)
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
    invoice_1, invoice_2, invoice_3 = create_list(:invoice, 3, customer: customer_1, merchant: merchant_1)
    invoice_4, invoice_5 = create_list(:invoice, 2, customer: customer_1, merchant: merchant_2)
    invoice_6 = create(:invoice, customer: customer_1, merchant: merchant_3)
    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_2, result: "failed")
    create(:transaction, invoice: invoice_3, result: "failed")
    create(:transaction, invoice: invoice_4, result: "failed")
    create(:transaction, invoice: invoice_4)
    create(:transaction, invoice: invoice_5)
    create(:transaction, invoice: invoice_6, result: "failed")

    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

    favorite_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(favorite_merchant["id"]).to eq(merchant_2.id)
    expect(favorite_merchant["name"]).to eq(merchant_2.name)
  end
end
