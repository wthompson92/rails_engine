require 'rails_helper'

RSpec.describe "Item InvoiceItems", type: :request do
  describe "request Invoices of all Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)

      @john = Customer.create(first_name: "John", last_name: "Smith")
      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")

      @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id:  @invoice_1.id, quantity: 100, unit_price: @lollipop.unit_price)
    end

    it "Returns Status Success" do
      get "/api/v1/items/#{@lollipop.id}/invoice_items"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant item attributes" do
      get "/api/v1/items/#{@lollipop.id}/invoice_items"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(["id", "invoice_id", "item_id", "quantity", "unit_price"])
     end

    it "JSON body response contains expected merchant data" do
      get "/api/v1/items/#{@lollipop.id}/invoice_items"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@invoice_item_1.id, @invoice_item_1.invoice_id, @invoice_item_1.item_id, @invoice_item_1.quantity, @invoice_item_1.unit_price])
    end
  end
end
