require 'rails_helper'

RSpec.describe "invoices items", type: :request do
  describe "request list of all items" do
    before :each do
      @customer = Customer.create(first_name: "John", last_name: "Smith")
    end

    it "Index returns Status Success" do
      get '/api/v1/customers'

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected  attributes" do
      get '/api/v1/customers'
      json_response = JSON.parse(response.body)['data'][0]["attributes"].keys

      expect(json_response).to match_array(['id', 'first_name', 'last_name'])
    end

    it "Show returns Status Success" do
      get "/api/v1/customers/#{@customer.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
  end
end
