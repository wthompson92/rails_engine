class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    items = Item.join_on_invoice((params[:id])[0])
    render json: ItemSerializer.new(items)
  end
end
