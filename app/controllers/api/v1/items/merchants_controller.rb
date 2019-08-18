class Api::V1::Items::MerchantsController < ApplicationController

  def show
    merchant = Merchant.where(item_id: params[:id])
    render json: MerchantSerializer.new(merchant)
  end
end
