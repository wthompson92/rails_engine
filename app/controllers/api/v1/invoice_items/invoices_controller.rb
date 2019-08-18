class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    invoice = Invoice.where(invoice_item_id: params[:id])
    render json: InvoiceSerializer.new(invoice)
  end
end
