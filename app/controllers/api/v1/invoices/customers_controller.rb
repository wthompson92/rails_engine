class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    customers = Customer.where(invoice_id: params[:id])
    render json: CustomerSerializer.new(customers)
  end
end