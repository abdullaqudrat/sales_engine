require "rails_helper"

describe "Items API" do
  describe "find_all controller" do
    it "should return items by id param" do
      i_1, i_2, i_3 = create_list(:item, 3)

      get "/api/v1/items/find_all?id=#{i_2.id}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_2.id)
      expect(items[0]["id"]).to_not eq(i_1.id)
      expect(items[0]["id"]).to_not eq(i_3.id)
    end
    it "should return items by name param" do
      i_1, i_2, i_3 = create_list(:item, 3)

      get "/api/v1/items/find_all?name=#{i_2.name}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_2.id)
      expect(items[0]["id"]).to_not eq(i_1.id)
      expect(items[0]["id"]).to_not eq(i_3.id)
    end
    it "should return items by created_at param" do
      i_1, i_2 = create_list(:item,2)

      get "/api/v1/items/find_all?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_1.id)
      expect(items[1]["id"]).to eq(i_2.id)
    end
    it "should return items by updated_at param" do
      i_1, i_2 = create_list(:item,2)

      get "/api/v1/items/find_all?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_1.id)
      expect(items[1]["id"]).to eq(i_2.id)
    end
    it "should return items by unit_price param" do
      i_1, i_2 = create_list(:item,2)

      get "/api/v1/items/find_all?unit_price=#{i_1.unit_price}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_1.id)
    end
    it "should return items by description param" do
      i_1, i_2 = create_list(:item,2)

      get "/api/v1/items/find_all?description=#{i_1.description}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_1.id)
    end
    it "should return items by merchant_id param" do
      i_1, i_2 = create_list(:item,2)

      get "/api/v1/items/find_all?merchant_id=#{i_1.merchant_id}"

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items[0]["id"]).to eq(i_1.id)
    end
  end
end
