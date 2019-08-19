class Api::V1::Items::RevenueController < ApplicationController

    def index
      render json: ItemSerializer.new(Item.most_revenue)
    end
end
