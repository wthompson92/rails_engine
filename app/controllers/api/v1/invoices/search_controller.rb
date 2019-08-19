class Api::V1::Invoices::SearchController < ApplicationController

  def show
    invoice = Invoice.find_by(invoice_params)
    render json: InvoiceSerializer.new(invoice)
  end

  def index
    invoice = Invoice.where(invoice_params)
    render json: InvoiceSerializer.new(invoice)
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status)
  end
end
