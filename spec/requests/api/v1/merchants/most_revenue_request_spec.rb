require "rails_helper"

describe "Merchants API" do
  xit "can get x merchants with top revenue"  do
     create_list(:merchant, 5)
     quantity = 3

    get "/api/v1/merchants/most_revenue?quantity=#{quantity}"

    top_merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end
end
