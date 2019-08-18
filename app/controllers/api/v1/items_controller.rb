class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.all, status: 200)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]), status: 200)
  end
end
