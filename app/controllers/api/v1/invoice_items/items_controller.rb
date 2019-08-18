class Api::V1::InvoiceItems::ItemsController < ApplicationController

    def show
      item = Item.join_on_invoice_item((params[:id])[0])
      render json: ItemSerializer.new(item)
    end
  end
