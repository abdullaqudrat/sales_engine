require "rails_helper"

describe "Invoice_item API" do
  describe "find_all controller" do
    it "should return invoice_items by id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?id=#{i_2.id}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items[0]["id"]).to eq(i_2.id)
      expect(invoice_items[0]["id"]).to_not eq(i_1.id)
      expect(invoice_items[0]["id"]).to_not eq(i_3.id)
    end
    it "should return invoice_items by merchant_id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?merchant_id=#{i_2.merchant_id}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items[0]["id"]).to eq(i_2.id)
    end
    it "should return invoice_items by status param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?status=#{i_2.status}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(3)
      expect(invoice_items[0]["id"]).to eq(i_1.id)
      expect(invoice_items[1]["id"]).to eq(i_2.id)
      expect(invoice_items[2]["id"]).to eq(i_3.id)
    end
    it "should return invoice_items by customer_id param" do
      i_1, i_2, i_3 = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find_all?customer_id=#{i_2.customer_id}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items[0]["id"]).to eq(i_2.id)
    end
    it "should return invoice_items by created_at param" do
      i_1, i_2 = create_list(:invoice_item,2)

      get "/api/v1/invoice_items/find_all?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items[0]["id"]).to eq(i_1.id)
      expect(invoice_items[1]["id"]).to eq(i_2.id)
    end
    it "should return invoice_items by updated_at param" do
      i_1, i_2 = create_list(:invoice_item,2)

      get "/api/v1/invoice_items/find_all?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      invoice_items = JSON.parse(response.body)

      expect(invoice_items[0]["id"]).to eq(i_1.id)
      expect(invoice_items[1]["id"]).to eq(i_2.id)
    end
  end
end
