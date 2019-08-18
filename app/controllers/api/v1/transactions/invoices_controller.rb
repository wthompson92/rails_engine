class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    invoice = Invoice.join_on_transaction((params[:id])[0])
    render json: InvoiceSerializer.new(invoice)
  end
end
