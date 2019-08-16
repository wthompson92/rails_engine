require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "request list of all items" do
    before :each do
      merchant = Merchant.create(name: 'Wonka')
      @item = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 1000, merchant_id: merchant.id)
    end

    it "Returns Status Success" do
      get '/api/v1/items'

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
end

  it "JSON body response contains expected item attributes" do
    get '/api/v1/items'
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(['id', 'name', 'description', 'unit_price', 'merchant_id'])

    end

    it "Returns Status Success" do
      get "/api/v1/items/#{@item.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
  end
end
