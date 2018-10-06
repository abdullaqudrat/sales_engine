require "rails_helper"

describe "Invoices API" do
  describe "find controller" do
    it "should return invoices by id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find?id=#{i_2.id}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_2.id)
      expect(invoice["id"]).to_not eq(i_1.id)
      expect(invoice["id"]).to_not eq(i_3.id)
    end
    it "should return invoices by customer_id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find?customer_id=#{i_2.customer_id}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_2.id)
      expect(invoice["id"]).to_not eq(i_1.id)
      expect(invoice["id"]).to_not eq(i_3.id)
    end
    it "should return invoices by merchant_id param" do
      i_1, i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find?merchant_id=#{i_2.merchant_id}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_2.id)
      expect(invoice["id"]).to_not eq(i_1.id)
      expect(invoice["id"]).to_not eq(i_3.id)
    end
    it "should return invoices by result param" do
      i_1 = create(:invoice, status: "pending")
      i_2, i_3 = create_list(:invoice, 3)

      get "/api/v1/invoices/find?status=#{i_2.status}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_2.id)
      expect(invoice["id"]).to_not eq(i_1.id)
      expect(invoice["id"]).to_not eq(i_3.id)
    end
    it "should return invoices by created_at param" do
      i_1 = create(:invoice)

      get "/api/v1/invoices/find?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_1.id)
    end
    it "should return invoices by updated_at param" do
      i_1 = create(:invoice)

      get "/api/v1/invoices/find?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(i_1.id)
    end
  end
end
