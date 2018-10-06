require "rails_helper"

describe "Invoice API" do
  it "can send transactions associated with the invoice" do
    invoice = create(:invoice)
    create_list(:transaction, 5, invoice: invoice)
    create(:transaction)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(Transaction.all.count).to eq(6)
    expect(transactions.count).to eq(5)
  end
end
