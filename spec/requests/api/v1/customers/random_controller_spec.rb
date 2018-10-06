require "rails_helper"

describe "Customers API" do
  describe "random controller" do
    it "sends a random customer upon request" do
      customer_1 = create(:customer)

      get "/api/v1/customers/random"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(customer_1.id)
    end
  end
end
