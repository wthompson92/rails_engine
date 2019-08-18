require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  describe "request list of all items" do
    before :each do
      merchant = Merchant.create(name: 'Willy Wonka')
      customer = Customer.create(first_name: "John", last_name: "Smith")
      @invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    end

    it "Returns Status Success" do
      get '/api/v1/invoices'

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected invoice attributes" do
      get '/api/v1/invoices'
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys

      expect(json_response).to match_array(['id', 'customer_id', 'merchant_id', 'status'])

    end

    it "Show returns Status Success" do
      get "/api/v1/invoices/#{@invoice.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected invoice attributes" do
      get "/api/v1/invoices/#{@invoice.id}"
      json_response = JSON.parse(response.body)["data"]["attributes"].keys

      expect(json_response).to match_array(['id', 'customer_id', 'merchant_id', 'status'])
    end

    it "JSON body response contains expected invoice data" do
      get "/api/v1/invoices/#{@invoice.id}"
      json_response = JSON.parse(response.body)["data"]["attributes"].values
      expect(json_response).to match_array([@invoice.id, @invoice.customer_id, @invoice.merchant_id, @invoice.status])
    end
  end
end
