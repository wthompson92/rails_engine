class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    invoices = Invoice.where(merchant_id: params[:id])
    render json: InvoiceSerializer.new(invoices)
  end
end
