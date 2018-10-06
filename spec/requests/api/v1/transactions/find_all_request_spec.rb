require "rails_helper"

describe "Transactions API" do
  describe "find_all controller" do
    it "should return transactions by id param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?id=#{i_2.id}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(i_2.id)
      expect(transactions[0]["id"]).to_not eq(i_1.id)
      expect(transactions[0]["id"]).to_not eq(i_3.id)
    end
    it "should return transactions by invoice_id param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?invoice_id=#{i_2.invoice_id}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(i_2.id)
    end
    it "should return transactions by result param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?result=#{i_2.result}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(3)
      expect(transactions[0]["id"]).to eq(i_1.id)
      expect(transactions[1]["id"]).to eq(i_2.id)
      expect(transactions[2]["id"]).to eq(i_3.id)
    end
    it "should return transactions by credit_card_number param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find_all?credit_card_number=#{i_2.credit_card_number}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(i_2.id)
    end
    it "should return transactions by created_at param" do
      i_1, i_2 = create_list(:transaction,2)

      get "/api/v1/transactions/find_all?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(i_1.id)
      expect(transactions[1]["id"]).to eq(i_2.id)
    end
    it "should return transactions by updated_at param" do
      i_1, i_2 = create_list(:transaction,2)

      get "/api/v1/transactions/find_all?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body)

      expect(transactions[0]["id"]).to eq(i_1.id)
      expect(transactions[1]["id"]).to eq(i_2.id)
    end
  end
end
