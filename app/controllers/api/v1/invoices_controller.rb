class Api::V1::InvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Item.all)
  end

   def show
    render json: InvoiceSerializer.new(Item.find(params[:id]))
    end
end
