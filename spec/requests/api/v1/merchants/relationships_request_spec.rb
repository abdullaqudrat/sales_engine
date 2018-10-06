require "rails_helper"

describe "Merchants API" do
  it "can get items associated with merchant" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(5)
  end
  it "can get items associated with merchant" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(5)
  end
end
