require "rails_helper"

describe "Items API" do
  describe "random controller" do
    it "sends a random item upon request" do
      item_1 = create(:item)

      get "/api/v1/items/random"

      expect(response).to be_successful

      item = JSON.parse(response.body)

      expect(item["id"]).to eq(item_1.id)
    end
  end
end
