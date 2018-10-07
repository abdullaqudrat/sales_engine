require "rails_helper"

describe "Customer API" do
  it "can send transactions associated with the customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    create_list(:transaction, 2, invoice: invoice)
    create(:transaction)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(Transaction.all.count).to eq(3)
    expect(transactions.count).to eq(2)
  end
  it "can send invoice associated with the customer" do
    customer = create(:customer)
    create_list(:invoice, 5, customer: customer)
    create(:invoice)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(Invoice.all.count).to eq(6)
    expect(invoices.count).to eq(5)
  end
end
