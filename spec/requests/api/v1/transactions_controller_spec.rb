require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "request list of all transactions" do
    before :each do
      merchant = Merchant.create(name: 'Willy Wonka')
      customer = Customer.create(first_name: "John", last_name: "Smith")
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
      @transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: 12345678, result: "success")
  end

    it "Returns Status Success" do
      get '/api/v1/transactions'

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected transactions attributes" do
     get '/api/v1/transactions'
     json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
     expect(json_response).to match_array(['id', 'invoice_id', 'credit_card_number', 'result'])
   end

    it "Returns Status Success" do
      get "/api/v1/transactions/#{@transaction.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
  end
end
