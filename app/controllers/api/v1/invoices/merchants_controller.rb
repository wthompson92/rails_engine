class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    merchant = Merchant.join_on_invoice((params[:id])[0])
    render json: MerchantSerializer.new(merchant)
  end
end
