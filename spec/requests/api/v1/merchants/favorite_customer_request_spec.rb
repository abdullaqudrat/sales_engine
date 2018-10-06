require "rails_helper"

describe "Merchants API" do
  it "can get total revenue of merchant"  do
    merchant = create(:merchant)
    c_1, c_2 = create_list(:customer, 2)
    i_1 = create(:item, unit_price: 9000, merchant: merchant)
    i_2 = create(:item, unit_price: 5000, merchant: merchant)
    i_3 = create(:item, unit_price: 1000, merchant: merchant)
    i_4 = create(:item, unit_price: 1500, merchant: merchant)
    i_5 = create(:item, unit_price: 9999, merchant: merchant)
    i_6 = create(:item, unit_price: 1000, merchant: merchant)
    in_1 = create(:invoice, merchant: merchant, customer: c_1)
    in_2 = create(:invoice, merchant: merchant, customer: c_2)
    in_3 = create(:invoice, merchant: merchant, customer: c_1)
    in_4 = create(:invoice, merchant: merchant, customer: c_2)
    in_5 = create(:invoice, merchant: merchant, customer: c_1, status: "cancelled")
    in_6 = create(:invoice, merchant: merchant, customer: c_2)
    create(:transaction, invoice: in_1)
    create(:transaction, invoice: in_2)
    create(:transaction, invoice: in_3)
    create(:transaction, invoice: in_4)
    create(:transaction, invoice: in_5, result: "failed")
    create(:transaction, invoice: in_6)
    create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
    create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
    create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
    create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
    create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)
    create(:invoice_item, item: i_6, invoice: in_6, quantity: 1, unit_price: i_6.unit_price)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    favorite_customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(favorite_customer["id"]).to eq(c_2.id)
    expect(favorite_customer["first_name"]).to eq(c_2.first_name)
  end
end
