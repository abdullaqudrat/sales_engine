require "rails_helper"

describe "Customers API" do
  describe "find_all controller" do
    it "should return customers by id param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?id=#{i_2.id}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(i_2.id)
      expect(customers[0]["id"]).to_not eq(i_1.id)
      expect(customers[0]["id"]).to_not eq(i_3.id)
    end
    it "should return customers by first_name param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?first_name=#{i_2.first_name}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(i_2.id)
      expect(customers[0]["id"]).to_not eq(i_1.id)
      expect(customers[0]["id"]).to_not eq(i_3.id)
    end
    it "should return customers by last_name param" do
      i_1, i_2, i_3 = create_list(:customer, 3)

      get "/api/v1/customers/find_all?last_name=#{i_2.last_name}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(i_2.id)
      expect(customers[0]["id"]).to_not eq(i_1.id)
      expect(customers[0]["id"]).to_not eq(i_3.id)
    end
    it "should return customers by created_at param" do
      i_1, i_2 = create_list(:customer,2)

      get "/api/v1/customers/find_all?created_at=#{i_1.created_at}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(i_1.id)
      expect(customers[1]["id"]).to eq(i_2.id)
    end
    it "should return customers by updated_at param" do
      i_1, i_2 = create_list(:customer,2)

      get "/api/v1/customers/find_all?updated_at=#{i_1.updated_at}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers[0]["id"]).to eq(i_1.id)
      expect(customers[1]["id"]).to eq(i_2.id)
    end
  end
end
