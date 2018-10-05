class Api::V1::Merchants::SingleRevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id])
    if params[:date]
      render json: { "revenue": merchant.total_revenue_by_date(merchant_params) }
    else
      render json: { "revenue": merchant.total_revenue }
    end
  end

  private
    def merchant_params
      params.permit(:id, :date)
    end
end
