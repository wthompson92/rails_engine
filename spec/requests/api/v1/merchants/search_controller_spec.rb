require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  describe "request list of all merchants" do
    before :each do
      @merchant = Merchant.create(name: 'Wonka')
    end

    it "Returns Status Success" do
      get "/api/v1/merchants/find_all?name=(#{@merchant.name})"


      expect(response).to be_successful
      expect(response).to have_http_status(:success)
end

  it "JSON body response contains expected merchant attributes" do
    get "/api/v1/merchants/find_all?name=#{@merchant.name}"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(['id', 'name'])

    end

    it "Returns Status Success" do
      get "/api/v1/merchants/find?name=#{@merchant.name}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

      it "JSON body response contains expected merchant attributes" do
        get "/api/v1/merchants/find?name=#{@merchant.name}"
       json_response = JSON.parse(response.body)["data"]["attributes"].keys
       expect(json_response).to match_array(['id', 'name'])
     end

     it "JSON body response contains expected merchant data" do
       get "/api/v1/merchants/find?name=#{@merchant.name}"
       json_response = JSON.parse(response.body)["data"]["attributes"].values
      expect(json_response).to match_array([@merchant.id, @merchant.name])
    end
  end
end
