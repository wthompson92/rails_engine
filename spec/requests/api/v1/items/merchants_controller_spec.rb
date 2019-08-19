require 'rails_helper'

RSpec.describe "Item Merchant", type: :request do
  describe "Returns Merchant for Given Item " do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)

    end

    it "Returns Status Success" do
      get "/api/v1/items/#{@lollipop.id}/merchant"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant attributes" do
      get "/api/v1/items/#{@lollipop.id}/merchant"
      json_response =
       JSON.parse(response.body)
       #["data"][0]['attributes'].keys
      expect(json_response).to match_array([ "id", "name"])
     end

    it "JSON body response contains expected merchant data" do
      get "/api/v1/items/#{@lollipop.id}/merchant"

      json_response = JSON.parse(response.body)
      #["data"][0]["attributes"].values

      expect(json_response).to match_array([@wonka.id, @wonka.name])
    end
  end
end
