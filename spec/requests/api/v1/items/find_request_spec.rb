require "rails_helper"

describe "Items API" do
  describe "find controller" do
    it "should return items by id param" do
      i_1, i_2, i_3 = create_list(:item, 3)

      get "/api/v1/items/find?id=#{i_2.id}"

      expect(response).to be_successful

      item = JSON.parse(response.body)

      expect(item["id"]).to eq(i_2.id)
      expect(item["id"]).to_not eq(i_1.id)
      expect(item["id"]).to_not eq(i_3.id)
    end
  end
end
