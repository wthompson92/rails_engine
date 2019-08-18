class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    items = Item.where(invoice_id: params[:id])
    render json: ItemSerializer.new(items)
  end
end
