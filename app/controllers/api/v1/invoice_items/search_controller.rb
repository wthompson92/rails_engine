class Api::V1::InvoiceItems::SearchController < ApplicationController

  def show
    invoice_item = InvoiceItem.find_by(invoice_item_params)
    render json: InvoiceItemSerializer.new(invoice_item)
  end

  def index
    invoice_item = InvoiceItem.where(invoice_item_params)
    render json: InvoiceItemSerializer.new(invoice_item)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
  end
end
