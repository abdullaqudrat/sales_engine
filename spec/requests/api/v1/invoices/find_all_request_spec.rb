require "rails_helper"

describe "Invoice API" do
  describe "find_all controller" do
    it "should return invoices by id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?id=#{i_2.id}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(i_2.id)
      expect(invoices[0]["id"]).to_not eq(i_1.id)
      expect(invoices[0]["id"]).to_not eq(i_3.id)
    end
    it "should return invoices by merchant_id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?merchant_id=#{i_2.merchant_id}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(i_2.id)
    end
    it "should return invoices by status param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?status=#{i_2.status}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(3)
      expect(invoices[0]["id"]).to eq(i_1.id)
      expect(invoices[1]["id"]).to eq(i_2.id)
      expect(invoices[2]["id"]).to eq(i_3.id)
    end
    it "should return invoices by customer_id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find_all?customer_id=#{i_2.customer_id}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(i_2.id)
    end
    it "should return invoices by created_at param" do
      i_1, i_2 = create_list(:invoice,2)

      get "/api/v1/invoices/find_all?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(i_1.id)
      expect(invoices[1]["id"]).to eq(i_2.id)
    end
    it "should return invoices by updated_at param" do
      i_1, i_2 = create_list(:invoice,2)

      get "/api/v1/invoices/find_all?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices[0]["id"]).to eq(i_1.id)
      expect(invoices[1]["id"]).to eq(i_2.id)
    end
  end
end
