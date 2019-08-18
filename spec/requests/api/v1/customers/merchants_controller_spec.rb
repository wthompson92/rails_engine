require 'rails_helper'

RSpec.describe "Customer Transactions", type: :request do
  describe "request list of all Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @john = Customer.create(first_name: "John", last_name: "Smith")
      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")
    end

    xit "Returns Status Success" do
      get "/api/v1/customers/#{@john.id}/merchant"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    xit "JSON body response contains expected merchant item attributes" do
      get "/api/v1/customers/#{@john.id}/merchant"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(["id", "name"])
     end

    xit "JSON body response contains expected merchant data" do
      get "/api/v1/customers/#{@john.id}/merhchant"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@wonka.id, @wonka.name])
    end
  end
end
