require "rails_helper"

describe "Invoice_items API" do
  describe "random controller" do
    it "sends a random invoice_item upon request" do
      invoice_item_1 = create(:invoice_item)

      get "/api/v1/invoice_items/random"

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item["id"]).to eq(invoice_item_1.id)
    end
  end
end
