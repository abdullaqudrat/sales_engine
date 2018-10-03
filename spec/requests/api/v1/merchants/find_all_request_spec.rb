require "rails_helper"

describe "Merchants API" do
  before(:each) do
    @merch_1, @merch_2, @merch_3 = create_list(:merchant, 3)
  end
  it "can get all merchants by find_all? - id" do

    get "/api/v1/merchants/find_all?id=#{@merch_1.id}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.length).to eq(1)
    expect(merchants[0]["id"]).to eq(@merch_1.id)
  end
  it "can get all merchants by find_all? - name" do

    get "/api/v1/merchants/find_all?name=#{@merch_2.name}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.length).to eq(1)
    expect(merchants[0]["name"]).to eq(@merch_2.name)
  end
  it "can get all merchants by find_all? - created_at" do

    get "/api/v1/merchants/find_all?created_at=#{@merch_3.created_at}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.length).to eq(3)
    expect(merchants[0]["id"]).to eq(@merch_1.id)
    expect(merchants[2]["name"]).to eq(@merch_3.name)
  end
  it "can get all merchants by find_all? - updated_at" do

    get "/api/v1/merchants/find_all?updated_at=#{@merch_2.updated_at}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.length).to eq(3)
    expect(merchants[0]["id"]).to eq(@merch_1.id)
    expect(merchants[1]["name"]).to eq(@merch_2.name)
  end

end
