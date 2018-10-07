class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    if params[:quantity]
      render json: Merchant.most_revenue(params[:quantity])
    else
      render json: Merchant.most_revenue
    end
  end

end
