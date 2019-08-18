class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.all, status: 200)
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find(params[:id]), status: 200)
  end
end
