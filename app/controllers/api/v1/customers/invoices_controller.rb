class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    invoices = Invoice.where(customer_id: params[:id])
    render json: InvoiceSerializer.new(invoices)
  end
end
