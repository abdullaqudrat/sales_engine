class Api::V1::Merchants::SingleRevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id])
    render json: merchant.total_revenue
  end
end
