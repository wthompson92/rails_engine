require 'rails_helper'

RSpec.describe "InvoiceItem Invoice", type: :request do
  describe "Returns the invoice that belongs to a single invoice item" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')

      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
      @john = Customer.create(first_name: "John", last_name: "Smith")

      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")

      @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id: @invoice_1.id, quantity: 100, unit_price: @lollipop.unit_price)

    end

    it "Returns Status Success" do
      get "/api/v1/invoice_items/#{@invoice_item_1.id}/invoices"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected  invoice attributes" do
      get "/api/v1/invoice_items/#{@invoice_item_1.id}/invoices"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(["customer_id","id", "merchant_id", "status"])
     end

    it "JSON body response contains expectedi nvoices data" do
      get "/api/v1/invoice_items/#{@invoice_item_1.id}/invoices"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@invoice_1.customer_id, @invoice_1.id,  @invoice_1.merchant_id, @invoice_1.status])
    end
  end
end
