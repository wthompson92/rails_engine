require 'rails_helper'

RSpec.describe "Merchants Invoices", type: :request do
  describe "request list of all Invoices for a single merchant" do
    before :each do
    @wonka = Merchant.create(name: 'Wonka')
    @nestle = Merchant.create(name: 'Nestle')
    @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @nestle.id)
    @jelly_bean = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
    @john = Customer.create(first_name: "John", last_name: "Smith")
    @jane = Customer.create(first_name: "Jane", last_name: "Doe")
    @dan = Customer.create(first_name: "Dan", last_name: "Johnson")
    @charlie = Customer.create(first_name: "Charlie", last_name: "Chocolate")
    @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @nestle.id, status: "shipped")
    @invoice_2 = Invoice.create( customer_id: @jane.id, merchant_id: @nestle.id, status: "shipped")
    @invoice_3 = Invoice.create( customer_id: @dan.id, merchant_id: @nestle.id, status: "shipped")
    @invoice_3 = Invoice.create( customer_id: @charlie.id, merchant_id: @nestle.id, status: "shipped")
    @invoice_5 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")
    @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id: @invoice_1.id, quantity: 100, unit_price: @lollipop.unit_price)
    @invoice_item_2 = InvoiceItem.create(item_id: @jelly_bean.id, invoice_id: @invoice_1.id, quantity: 10, unit_price: @jelly_bean.unit_price)
    @invoice_item_3 = InvoiceItem.create(item_id: @jelly_bean.id, invoice_id: @invoice_2.id, quantity: 100, unit_price: @jelly_bean.unit_price)
     end

    it "Returns Status Success" do
      get "/api/v1/merchants/#{@wonka.id}/invoices"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

      it "JSON body response contains expected merchant invoice attributes" do
        get "/api/v1/merchants/#{@wonka.id}/invoices"
        json_response = JSON.parse(response.body)["data"][0]["attributes"].keys

        expect(json_response).to match_array(["customer_id", "id", "merchant_id", "status"])
     end

     xit "JSON body response contains expected merchant data" do
       get "/api/v1/merchants/#{@wonka.id}/invoices"
       json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@invoice_1.id,  @invoice_1.customer_id, @invoice_1.merchant_id, @invoice_1.status])
    end
  end
end
