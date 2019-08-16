
class Api::V1::Merchants::SearchController < ApplicationController
  def show
    merchant = Merchant.find_by(merchant_params)
    render json: MerchantSerializer.new(merchant)
  end

def index
  merchant = Merchant.where(merchant_params)
  render json: MerchantSerializer.new(merchant)
end
  private

  def merchant_params
  params.permit(:id, :name)
    end
end
