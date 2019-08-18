class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all, status: 200)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]), status: 200)
 end
end
