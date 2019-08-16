class Api::V1::TransactionsController < ApplicationController

  def show
     render json: TransactionSerializer.new(Transaction.find(params[:id]), status: 200)
   end

   def index
     render json: TransactionSerializer.new(Transaction.all, status: 200)
   end
end
