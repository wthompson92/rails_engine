class Api::V1::Invoices::MerchantsController < ApplicationController

  def index
    merchant = Merchant.where(invoice_id: params[:id])
    render json: MerchantSerializer.new(merchant)
  end
end
