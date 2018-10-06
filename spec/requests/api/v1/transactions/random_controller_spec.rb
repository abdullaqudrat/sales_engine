require "rails_helper"

describe "Transactions API" do
  describe "random controller" do
    it "sends a random transaction upon request" do
      transaction_1 = create(:transaction)

      get "/api/v1/transactions/random"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(transaction_1.id)
    end
  end
end
