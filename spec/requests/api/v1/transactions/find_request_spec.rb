require "rails_helper"

describe "Transactions API" do
  describe "find controller" do
    it "should return transactions by id param" do
      t_1, t_2, t_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?id=#{t_2.id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_2.id)
      expect(transaction["id"]).to_not eq(t_1.id)
      expect(transaction["id"]).to_not eq(t_3.id)
    end
    it "should return transactions by invoice_id param" do
      t_1, t_2, t_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?invoice_id=#{t_2.invoice_id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_2.id)
      expect(transaction["id"]).to_not eq(t_1.id)
      expect(transaction["id"]).to_not eq(t_3.id)
    end
    it "should return transactions by credit_card_number param" do
      t_1, t_2, t_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?credit_card_number=#{t_2.credit_card_number}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_2.id)
      expect(transaction["id"]).to_not eq(t_1.id)
      expect(transaction["id"]).to_not eq(t_3.id)
    end
    it "should return transactions by result param" do
      t_1 = create(:transaction, result: "failed")
      t_2, t_3 = create_list(:transaction, 3)

      get "/api/v1/transactions/find?result=#{t_2.result}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_2.id)
      expect(transaction["id"]).to_not eq(t_1.id)
      expect(transaction["id"]).to_not eq(t_3.id)
    end
    it "should return transactions by created_at param" do
      t_1 = create(:transaction)

      get "/api/v1/transactions/find?created_at=#{t_1.created_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_1.id)
    end
    it "should return transactions by updated_at param" do
      t_1 = create(:transaction)

      get "/api/v1/transactions/find?updated_at=#{t_1.updated_at}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body)

      expect(transaction["id"]).to eq(t_1.id)
    end
  end
end
