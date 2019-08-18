require 'rails_helper'

RSpec.describe "Item Merchant", type: :request do
  describe "Returns Merchant for Given Item Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
      @jelly_bean = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
    end

    it "Returns Status Success" do
      get "/api/v1/items/#{@lollipop.id}/merchant"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant item attributes" do
      get "/api/v1/items/#{@lollipop.id}/merchant"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array([ "credit_card_number", "id", "invoice_id", "result"])
     end

    it "JSON body response contains expected merchant data" do
      get "/api/v1/items/#{@lollipop.id}/merchant"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@transactions_1.id, @transactions_1.invoice_id,  @transactions_1.credit_card_number, @transactions_1.result])
    end
  end
end
