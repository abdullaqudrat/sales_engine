require "rails_helper"

describe "Customers API" do
  describe "find controller" do
    it "should return customers by id param" do
      c_1, c_2, c_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?id=#{c_2.id}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(c_2.id)
      expect(customer["id"]).to_not eq(c_1.id)
      expect(customer["id"]).to_not eq(c_3.id)
    end
    it "should return customers by first_name param" do
      c_1, c_2, c_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?first_name=#{c_2.first_name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(c_2.id)
      expect(customer["id"]).to_not eq(c_1.id)
      expect(customer["id"]).to_not eq(c_3.id)
    end
    it "should return customers by first_name param" do
      c_1, c_2, c_3 = create_list(:customer, 3)

      get "/api/v1/customers/find?first_name=#{c_2.first_name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(c_2.id)
      expect(customer["id"]).to_not eq(c_1.id)
      expect(customer["id"]).to_not eq(c_3.id)
    end
    it "should return customers by created_at param" do
      c_1 = create(:customer)

      get "/api/v1/customers/find?created_at=#{c_1.created_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(c_1.id)
    end
    it "should return customers by updated_at param" do
      c_1 = create(:customer)

      get "/api/v1/customers/find?updated_at=#{c_1.updated_at}"

      expect(response).to be_successful

      customer = JSON.parse(response.body)

      expect(customer["id"]).to eq(c_1.id)
    end
  end
end
