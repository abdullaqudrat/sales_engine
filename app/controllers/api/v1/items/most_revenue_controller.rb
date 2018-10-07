class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    if params[:quantity]
      render json: Item.most_revenue(params[:quantity])
    else
      render json: Item.most_revenue
    end
  end

end
