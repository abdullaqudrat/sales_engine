require "rails_helper"

describe "Customers API" do
  describe "find_all controller" do
    it "should return customers by id param" do
      c_1, c_2, c_3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?id=#{c_2.id}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(c_2.id)
      expect(customers[0]["id"]).to_not eq(c_1.id)
      expect(customers[0]["id"]).to_not eq(c_3.id)
    end
    it "should return customers by first_name param" do
      c_1, c_2, c_3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?first_name=#{c_2.first_name}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(c_2.id)
      expect(customers[0]["id"]).to_not eq(c_1.id)
      expect(customers[0]["id"]).to_not eq(c_3.id)
    end
    it "should return customers by last_name param" do
      c_2 = create(:customer)

      get "/api/v1/customers/find_all?last_name=#{c_2.last_name}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(c_2.id)
    end
    it "should return customers by created_at param" do
      c_1, c_2 = create_list(:customer,2)

      get "/api/v1/customers/find_all?created_at=#{c_1.created_at}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(c_1.id)
      expect(customers[1]["id"]).to eq(c_2.id)
    end
    it "should return customers by updated_at param" do
      c_1, c_2 = create_list(:customer,2)

      get "/api/v1/customers/find_all?updated_at=#{c_1.updated_at}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(c_1.id)
      expect(customers[1]["id"]).to eq(c_2.id)
    end
  end
end
