class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_revenue)
  end

  def show

    render json: MerchantSerializer.new(Merchant.single_merchant_revenue)
  end
end
