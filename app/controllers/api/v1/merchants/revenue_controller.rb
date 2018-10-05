class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: { "total_revenue": Merchant.all_revenue_by_date(params[:date]) }
  end

  def show
  end
end
