class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    item = Item.where(invoice_item_id: params[:id])
    render json: ItemSerializer.new(item)
  end
end
