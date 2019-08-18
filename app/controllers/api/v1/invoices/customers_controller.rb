class Api::V1::Invoices::CustomersController < ApplicationController

def show
  customer = Customer.join_on_invoice((params[:id])[0])
  render json: CustomerSerializer.new(customer)
  end
end
