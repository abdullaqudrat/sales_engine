require "rails_helper"

describe "Invoice_items API" do
  describe "find controller" do
    it "should return invoice_items by id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?id=#{i_2.id}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_2.id)
      expect(invoice_item["id"]).to_not eq(i_1.id)
      expect(invoice_item["id"]).to_not eq(i_3.id)
    end
    it "should return invoice_items by customer_id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?customer_id=#{i_2.customer_id}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_2.id)
      expect(invoice_item["id"]).to_not eq(i_1.id)
      expect(invoice_item["id"]).to_not eq(i_3.id)
    end
    it "should return invoice_items by merchant_id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?merchant_id=#{i_2.merchant_id}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_2.id)
      expect(invoice_item["id"]).to_not eq(i_1.id)
      expect(invoice_item["id"]).to_not eq(i_3.id)
    end
    it "should return invoice_items by result param" do
      i_1 = create(:invoice_item, status: "pending")
      i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?status=#{i_2.status}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_2.id)
      expect(invoice_item["id"]).to_not eq(i_1.id)
      expect(invoice_item["id"]).to_not eq(i_3.id)
    end
    it "should return invoice_items by created_at param" do
      i_1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_1.id)
    end
    it "should return invoice_items by updated_at param" do
      i_1 = create(:invoice_item)

      get "/api/v1/invoice_items/find?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(i_1.id)
    end
  end
end
