class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    transactions = Transaction.where(invoice_id: params[:id])
    render json: TransactionSerializer.new(transactions)
  end
end
