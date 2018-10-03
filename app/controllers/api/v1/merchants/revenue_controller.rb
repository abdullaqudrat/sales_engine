class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.all_revenue_by_date(params[:date])
  end

  def show
  end
end
