class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: { "total_revenue": Merchant.all_revenue_by_date(params[:date]).to_s }
  end

  def show
  end
end
