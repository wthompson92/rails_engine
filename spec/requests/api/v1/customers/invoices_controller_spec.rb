require 'rails_helper'

RSpec.describe "Customer Transactions", type: :request do
  describe "request list of all transactions for a single customer" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')

      @john = Customer.create(first_name: "John", last_name: "Smith")

      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")



    end

    it "Returns Status Success" do
      get "/api/v1/customers/#{@john.id}/invoices"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected customer invoice attributes" do
      get "/api/v1/customers/#{@john.id}/invoices"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(["customer_id","id", "merchant_id", "status"])
     end

    it "JSON body response contains expected customer invoices attributes" do
      get "/api/v1/customers/#{@john.id}/invoices"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@invoice_1.customer_id, @invoice_1.id,  @invoice_1.merchant_id, @invoice_1.status])
    end
  end
end
