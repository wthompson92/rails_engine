class Api::V1::InvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.all, status: 200)
  end

  def show
    render json: InvoiceSerializer.new(Invoice.find(params[:id]), status: 200)
  end
end
