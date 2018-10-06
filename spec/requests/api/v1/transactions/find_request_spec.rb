require "rails_helper"

describe "Transactions API" do
  describe "find controller" do
    it "should return transactions by id param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?id=#{i_2.id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_2.id)
      expect(transaction["id"]).to_not eq(i_1.id)
      expect(transaction["id"]).to_not eq(i_3.id)
    end
    it "should return transactions by invoice_id param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?invoice_id=#{i_2.invoice_id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_2.id)
      expect(transaction["id"]).to_not eq(i_1.id)
      expect(transaction["id"]).to_not eq(i_3.id)
    end
    it "should return transactions by credit_card_number param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?credit_card_number=#{i_2.credit_card_number}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_2.id)
      expect(transaction["id"]).to_not eq(i_1.id)
      expect(transaction["id"]).to_not eq(i_3.id)
    end
    it "should return transactions by result param" do
      i_1, i_2, i_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?result=#{i_2.result}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_2.id)
      expect(transaction["id"]).to_not eq(i_1.id)
      expect(transaction["id"]).to_not eq(i_3.id)
    end
    it "should return transactions by created_at param" do
      i_1 = create(:transaction)

      get "/api/v1/transactions/find?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_1.id)
    end
    it "should return transactions by updated_at param" do
      i_1 = create(:transaction)

      get "/api/v1/transactions/find?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(i_1.id)
    end
  end
end
