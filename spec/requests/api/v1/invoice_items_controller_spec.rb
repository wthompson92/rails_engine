require 'rails_helper'

RSpec.describe "Invoices Items", type: :request do
  describe "request list of all invoice items" do
    before :each do
    merchant = Merchant.create(name: 'Wonka')

    item = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 1000, merchant_id: merchant.id)

    customer = Customer.create(first_name: "John", last_name: "Smith")
    invoice = Invoice.create( customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    @invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: 100, unit_price: 10)
  end

    it "Index returns Status Success" do
      get '/api/v1/invoice_items'

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected  attributes" do
      get '/api/v1/invoice_items'
        json_response = JSON.parse(response.body)['data'][0]["attributes"].keys

        expect(json_response).to match_array(['item_id', 'invoice_id', 'quantity', 'unit_price'])
    end

    it "Show returns Status Success" do
      get "/api/v1/invoice_items/#{@invoice_item.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected invoice item attributes" do
      get "/api/v1/invoice_items/#{@invoice_item.id}"
     json_response = JSON.parse(response.body)["data"]["attributes"].keys
     expect(json_response).to match_array([ 'item_id', 'invoice_id', 'quantity', 'unit_price'])
   end

   it "JSON body response contains expected invoice item data" do
     get "/api/v1/invoice_items/#{@invoice_item.id}"
     json_response = JSON.parse(response.body)["data"]["attributes"].values
    expect(json_response).to match_array([@invoice_item.item_id, @invoice_item.invoice_id, @invoice_item.quantity, @invoice_item.unit_price])
    end
  end
end
