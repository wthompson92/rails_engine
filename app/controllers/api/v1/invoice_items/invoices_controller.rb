class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    invoice = Invoice.join_on_invoice_item((params[:id])[0])
    render json: InvoiceSerializer.new(invoice)
  end
end
