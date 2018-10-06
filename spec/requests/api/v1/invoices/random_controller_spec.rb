require "rails_helper"

describe "Invoices API" do
  describe "random controller" do
    it "sends a random invoice upon request" do
      invoice_1 = create(:invoice)

      get "/api/v1/invoices/random"

      expect(response).to be_successful

      invoice = JSON.parse(response.body)

      expect(invoice["id"]).to eq(invoice_1.id)
    end
  end
end
