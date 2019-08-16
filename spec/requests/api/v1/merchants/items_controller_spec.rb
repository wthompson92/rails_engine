require 'rails_helper'

RSpec.describe "Merchants Items", type: :request do
  describe "request list of all Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')

      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
      @jelly_bean = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)    end

    it "Returns Status Success" do
      get "/api/v1/merchants/:#{@wonka.id}/items"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

      xit "JSON body response contains expected merchant attributes" do
        get "/api/v1/merchants/:#{@merchant.id}/items"
       json_response = JSON.parse(response.body)["data"]["attributes"].keys
       expect(json_response).to match_array(['id', 'name'])
     end

     xit "JSON body response contains expected merchant data" do
       get "/api/v1/merchants/find?name=#{@merchant.name}"
       json_response = JSON.parse(response.body)["data"]["attributes"].values
      expect(json_response).to match_array([@merchant.id, @merchant.name])
    end
  end
end
