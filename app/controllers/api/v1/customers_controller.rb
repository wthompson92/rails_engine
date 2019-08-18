class Api::V1::CustomersController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.all, status: 200)
  end

  def show
    render json: CustomerSerializer.new(Customer.find(params[:id]), status: 200)
  end
end
