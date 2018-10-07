require "rails_helper"

describe "Transactions API" do
  it "can send invoice associated with the transaction" do
    invoice_1 = create(:invoice)
    transaction = create(:transaction, invoice: invoice_1)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
