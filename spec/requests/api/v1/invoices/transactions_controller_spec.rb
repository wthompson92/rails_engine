require 'rails_helper'

RSpec.describe "Invoice Transactions", type: :request do
  describe "request list of all Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @nestle = Merchant.create(name: 'Nestle')
      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @nestle.id)
      @jelly_bean = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
      @john = Customer.create(first_name: "John", last_name: "Smith")

      @charlie = Customer.create(first_name: "Charlie", last_name: "Chocolate")
      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @nestle.id, status: "shipped")

      @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id: @invoice_1.id, quantity: 100, unit_price: @lollipop.unit_price)
      @invoice_item_2 = InvoiceItem.create(item_id: @jelly_bean.id, invoice_id: @invoice_1.id, quantity: 10, unit_price: @jelly_bean.unit_price)

      @transactions_1 = Transaction.create(invoice_id: @invoice_1.id, credit_card_number: 123345678, result: "success")
      @transactions_2 = Transaction.create(invoice_id: @invoice_1.id, credit_card_number: 123345678, result: "success")

    end

    it "Returns Status Success" do
      get "/api/v1/invoices/#{@invoice_1.id}/transactions"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant item attributes" do
      get "/api/v1/invoices/#{@invoice_1.id}/transactions"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array([ "credit_card_number", "id", "invoice_id", "result"])
     end

    it "JSON body response contains expected merchant data" do
      get "/api/v1/invoices/#{@invoice_1.id}/transactions"

      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@transactions_1.id, @transactions_1.invoice_id,  @transactions_1.credit_card_number, @transactions_1.result])
    end
  end
end
