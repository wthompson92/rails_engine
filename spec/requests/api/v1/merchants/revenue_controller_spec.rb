require 'rails_helper'

RSpec.describe "Merchant Revenue", type: :request do
  describe "Returns list of merchants sorted by revenue" do
    before :each do
      @wonka = Merchant.create(name: 'Wonka')
      @nestle = Merchant.create(name: 'Nestle')

      @lollipop = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 10, merchant_id: @wonka.id)
      @jelly_bean = Item.create(name: 'lollipop', description: 'This is a lollipop', unit_price: 100, merchant_id: @wonka.id)
      @kit_kat = Item.create(name: 'kit_kat', description: 'This is a lollipop', unit_price: 100, merchant_id: @wonka.id)

      @john = Customer.create(first_name: "John", last_name: "Smith")


      @invoice_1 = Invoice.create(customer_id: @john.id, merchant_id: @wonka.id, status: "shipped")
      @invoice_2 = Invoice.create(customer_id: @john.id, merchant_id: @nestle.id, status: "shipped")
      @invoice_3 = Invoice.create(customer_id: @john.id, merchant_id: @nestle.id, status: "shipped")

      @invoice_item_1 = InvoiceItem.create(item_id: @lollipop.id, invoice_id: @invoice_1.id, quantity: 1, unit_price: @lollipop.unit_price)

      @invoice_item_2 = InvoiceItem.create(item_id: @jelly_bean.id, invoice_id: @invoice_1.id, quantity: 10, unit_price: @jelly_bean.unit_price)
      
      @invoice_item_3 = InvoiceItem.create(item_id: @kit_kat.id, invoice_id: @invoice_1.id, quantity: 100, unit_price: @kit_kat.unit_price)
      end


    it "Returns Status Success" do
      get "/api/v1/merchants/most_revenue"

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected merchant attributes" do
      get "/api/v1/merchants/most_revenue"

      json_response = JSON.parse(response.body)
      #["data"][0]["attributes"].keys
      expect(json_response).to match_array(['id', 'name'])
    end



    xit "JSON body response contains expected merchant data" do
      get "/api/v1/merchants/most_revenue"
      json_response = JSON.parse(response.body)["data"][0]["attributes"].values
      expect(json_response).to match_array([@wonka.id, @wonka.name])
    end
  end
end
