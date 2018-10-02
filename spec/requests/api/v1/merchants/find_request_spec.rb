require "rails_helper"

describe "Merchants API" do
  it "can get one merchant by find? - id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end
  it "can get one merchant by find? - name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["name"]).to eq(name)
  end
  it "can get one merchant by find? - created_at" do
    merch = create(:merchant)

    get "/api/v1/merchants/find?created_at=#{merch.created_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merch.id)
    expect(merchant["name"]).to eq(merch.name)
  end
  it "can get one merchant by find? - updated_at" do
    merch = create(:merchant)

    get "/api/v1/merchants/find?updated_at=#{merch.updated_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merch.id)
    expect(merchant["name"]).to eq(merch.name)
  end
end
