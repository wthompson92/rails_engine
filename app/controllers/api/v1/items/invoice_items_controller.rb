class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    invoice_items = InvoiceItem.where(item_id: params[:id])
    render json: InvoiceItemSerializer.new(invoice_items)
  end
end
