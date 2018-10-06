require "rails_helper"

describe "Customers API" do
  describe "find controller" do
    it "should return customers by id param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?id=#{i_2.id}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(i_2.id)
      expect(customer["id"]).to_not eq(i_1.id)
      expect(customer["id"]).to_not eq(i_3.id)
    end
    it "should return customers by first_name param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?first_name=#{i_2.first_name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(i_2.id)
      expect(customer["id"]).to_not eq(i_1.id)
      expect(customer["id"]).to_not eq(i_3.id)
    end
    it "should return customers by first_name param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?first_name=#{i_2.first_name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(i_2.id)
      expect(customer["id"]).to_not eq(i_1.id)
      expect(customer["id"]).to_not eq(i_3.id)
    end
    it "should return customers by created_at param" do
      i_1 = create(:customer)

      get "/api/v1/customers/find?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(i_1.id)
    end
    it "should return customers by updated_at param" do
      i_1 = create(:customer)

      get "/api/v1/customers/find?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(i_1.id)
    end
  end
end
