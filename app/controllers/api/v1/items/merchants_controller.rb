class Api::V1::Items::MerchantsController < ApplicationController

      def show
        merchant = Merchant.join_on_item((params[:id])[0])
        render json: MerchantSerializer.new(merchant)
      end
    end
