class Api::V1::Transactions::SearchController < ApplicationController

  def show
    transaction = Transaction.find_by(transaction_params)
    render json: TransactionSerializer.new(transaction)
  end

  def index
    transaction = Transaction.where(transaction_params)
    render json:TransactionSerializer.new(transaction)
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date)
  end

end 
