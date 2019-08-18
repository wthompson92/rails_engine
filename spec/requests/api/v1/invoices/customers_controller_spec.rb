require 'rails_helper'

RSpec.describe "Invoice Customer", type: :request do
  describe "request gives customer for singe invoice" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')

      @dan = Customer.create(first_name: "Dan", last_name: "Johnson")
      @charlie = Customer.create(first_name: "Charlie", last_name: "Chocolate")
      @invoice_1 = Invoice.create( customer_id: @charlie.id, merchant_id: @wonka.id, status: "shipped")
      @invoice_2 = Invoice.create( customer_id: @dan.id, merchant_id: @wonka.id, status: "shipped")

    end

    it "Returns Status Success" do
      get "/api/v1/invoices/#{@invoice_1.id}/customer"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    xit "JSON body response contains expected merchant item attributes" do
      get "/api/v1/invoices/#{@invoice_1.id}/customer"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(['id', 'first_name', 'last_name'])
     end

    xit "JSON body response contains expected merchant data" do
      get "/api/v1/invoices/#{@invoice_1.id}/customer"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@lollipop.id, @lollipop.name, @lollipop.unit_price, @lollipop.merchant_id])
    end
  end
end
