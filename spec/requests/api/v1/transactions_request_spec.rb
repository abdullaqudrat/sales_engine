require "rails_helper"

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 5)

    get "/api/v1/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(5)
  end
  it "sends a transaction" do
    transaction_1 = create(:transaction)

    get "/api/v1/transactions/#{transaction_1.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(transaction_1.id)
  end
end
