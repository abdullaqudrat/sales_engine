require "rails_helper"

describe "Merchants API" do
  it "can get x merchants with top revenue"  do
    m_1, m_2, m_3, m_4, m_5 = create_list(:merchant, 5)
    c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
    i_1 = create(:item, unit_price: 9000, merchant: m_3)
    i_2 = create(:item, unit_price: 5000, merchant: m_1)
    i_3 = create(:item, unit_price: 1000, merchant: m_5)
    i_4 = create(:item, unit_price: 1500, merchant: m_2)
    i_5 = create(:item, unit_price: 9999, merchant: m_4)
    in_1 = create(:invoice, merchant: m_3, customer: c_1)
    in_2 = create(:invoice, merchant: m_1, customer: c_2)
    in_3 = create(:invoice, merchant: m_5, customer: c_3)
    in_4 = create(:invoice, merchant: m_2, customer: c_4)
    in_5 = create(:invoice, merchant: m_4, customer: c_5, status: "cancelled")
    create(:transaction, invoice: in_1)
    create(:transaction, invoice: in_2)
    create(:transaction, invoice: in_3)
    create(:transaction, invoice: in_4)
    create(:transaction, invoice: in_5, result: "failed")
    create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
    create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
    create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
    create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
    create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

    quantity = 3

    get "/api/v1/merchants/most_revenue?quantity=#{quantity}"

    top_merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(top_merchants[0]["id"]).to eq(m_3.id)
    expect(top_merchants[1]["id"]).to eq(m_1.id)
    expect(top_merchants[2]["id"]).to eq(m_5.id)

    get "/api/v1/merchants/most_revenue"

    top_merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(top_merchants[0]["id"]).to eq(m_3.id)
    expect(top_merchants[1]["id"]).to eq(m_1.id)
    expect(top_merchants[2]["id"]).to eq(m_5.id)
    expect(top_merchants[3]["id"]).to eq(m_2.id)
  end
  it "can get total revenue of merchants by date"  do
    m_1, m_2, m_3, m_4, m_5 = create_list(:merchant, 5)
    c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
    i_1 = create(:item, unit_price: 9000, merchant: m_3)
    i_2 = create(:item, unit_price: 5000, merchant: m_1)
    i_3 = create(:item, unit_price: 1000, merchant: m_5)
    i_4 = create(:item, unit_price: 1500, merchant: m_2)
    i_5 = create(:item, unit_price: 9999, merchant: m_4)
    in_1 = create(:invoice, merchant: m_3, customer: c_1, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC")
    in_2 = create(:invoice, merchant: m_1, customer: c_2, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-28 12:54:00 UTC")
    in_3 = create(:invoice, merchant: m_5, customer: c_3, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC")
    in_4 = create(:invoice, merchant: m_2, customer: c_4, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-28 12:54:00 UTC")
    in_5 = create(:invoice, merchant: m_4, customer: c_5, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC", status: "cancelled")
    create(:transaction, invoice: in_1)
    create(:transaction, invoice: in_2)
    create(:transaction, invoice: in_3)
    create(:transaction, invoice: in_4)
    create(:transaction, invoice: in_5, result: "failed")
    create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
    create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
    create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
    create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
    create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

    date_1 = "2018-10-27 12:54:00 UTC"
    date_2 = "2018-10-28 12:54:00 UTC"

    get "/api/v1/merchants/revenue?date=#{date_1}"

    total_revenue_by_date_1 = JSON.parse(response.body)

    get "/api/v1/merchants/revenue?date=#{date_2}"

    total_revenue_by_date_2 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(total_revenue_by_date_1).to eq({"total_revenue" => "20000.0"})
    expect(total_revenue_by_date_2).to eq({"total_revenue" => "11500.0"})
  end
  it "can get total revenue of merchant"  do
    merchant = create(:merchant)
    c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
    i_1 = create(:item, unit_price: 9000, merchant: merchant)
    i_2 = create(:item, unit_price: 5000, merchant: merchant)
    i_3 = create(:item, unit_price: 1000, merchant: merchant)
    i_4 = create(:item, unit_price: 1500, merchant: merchant)
    i_5 = create(:item, unit_price: 9999, merchant: merchant)
    in_1 = create(:invoice, merchant: merchant, customer: c_1)
    in_2 = create(:invoice, merchant: merchant, customer: c_2)
    in_3 = create(:invoice, merchant: merchant, customer: c_3)
    in_4 = create(:invoice, merchant: merchant, customer: c_4)
    in_5 = create(:invoice, merchant: merchant, customer: c_5, status: "cancelled")
    create(:transaction, invoice: in_1)
    create(:transaction, invoice: in_2)
    create(:transaction, invoice: in_3)
    create(:transaction, invoice: in_4)
    create(:transaction, invoice: in_5, result: "failed")
    create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
    create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
    create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
    create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
    create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    total_revenue = JSON.parse(response.body)

    expect(response).to be_successful
    expect(total_revenue).to eq({"revenue"=>"31500.0"})
  end
  it "can get total revenue of merchants by date"  do
    merchant = create(:merchant)
    c_1, c_2, c_3, c_4, c_5 = create_list(:customer, 5)
    i_1 = create(:item, unit_price: 9000, merchant: merchant)
    i_2 = create(:item, unit_price: 5000, merchant: merchant)
    i_3 = create(:item, unit_price: 1000, merchant: merchant)
    i_4 = create(:item, unit_price: 1500, merchant: merchant)
    i_5 = create(:item, unit_price: 9999, merchant: merchant)
    in_1 = create(:invoice, merchant: merchant, customer: c_1, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC")
    in_2 = create(:invoice, merchant: merchant, customer: c_2, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-28 12:54:00 UTC")
    in_3 = create(:invoice, merchant: merchant, customer: c_3, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC")
    in_4 = create(:invoice, merchant: merchant, customer: c_4, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-28 12:54:00 UTC")
    in_5 = create(:invoice, merchant: merchant, customer: c_5, created_at: "2018-10-26 11:54:00 UTC", updated_at: "2018-10-27 12:54:00 UTC", status: "cancelled")
    create(:transaction, invoice: in_1)
    create(:transaction, invoice: in_2)
    create(:transaction, invoice: in_3)
    create(:transaction, invoice: in_4)
    create(:transaction, invoice: in_5, result: "failed")
    create(:invoice_item, item: i_1, invoice: in_1, quantity: 2, unit_price: i_1.unit_price)
    create(:invoice_item, item: i_2, invoice: in_2, quantity: 2, unit_price: i_2.unit_price)
    create(:invoice_item, item: i_3, invoice: in_3, quantity: 2, unit_price: i_3.unit_price)
    create(:invoice_item, item: i_4, invoice: in_4, quantity: 1, unit_price: i_4.unit_price)
    create(:invoice_item, item: i_5, invoice: in_5, quantity: 1, unit_price: i_5.unit_price)

    date_1 = "2018-10-27 12:54:00 UTC"
    date_2 = "2018-10-28 12:54:00 UTC"

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date_1}"

    total_revenue_by_date_1 = JSON.parse(response.body)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date_2}"

    total_revenue_by_date_2 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(total_revenue_by_date_1).to eq({"revenue"=>"20000.0"})
    expect(total_revenue_by_date_2).to eq({"revenue"=>"11500.0"})
  end
end
