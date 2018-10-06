require "rails_helper"

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 5)

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
  end
  it "sends an item" do
    item_1 = create(:item)

    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_1.id)
  end
end
