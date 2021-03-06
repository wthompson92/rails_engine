require 'rails_helper'

RSpec.describe "Merchants Items", type: :request do
  describe "request list of all Items for a single merchant" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @lollipop = @wonka.items.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10)

      @john = Customer.create(first_name: "John", last_name: "Smith")
      @jane = Customer.create(first_name: "Jane", last_name: "Doe")
      @dan = Customer.create(first_name: "Dan", last_name: "Johnson")
      @charlie = Customer.create(first_name: "Charlie", last_name: "Chocolate")

      @invoice_1 = Invoice.create( customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")
      @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id: @invoice_1.id, quantity: 100, unit_price: @lollipop.unit_price)

    end

    it "Returns Status Success" do
      get "/api/v1/merchants/#{@wonka.id}/items"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant item attributes" do
      get "/api/v1/merchants/#{@wonka.id}/items"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].keys
      expect(json_response).to match_array(['id', 'name', 'description', 'unit_price', 'merchant_id'])
     end

    it "JSON body response contains expected merchant data" do
      get "/api/v1/merchants/#{@wonka.id}/items"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].values

      expect(json_response).to match_array([@lollipop.id, @lollipop.name, @lollipop.description, @lollipop.unit_price, @lollipop.merchant_id])
    end
  end
end
