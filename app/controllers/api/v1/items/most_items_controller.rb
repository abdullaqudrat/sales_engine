class Api::V1::Items::MostItemsController < ApplicationController

  def index
    if params[:quantity]
      render json: Item.most_sold(params[:quantity])
    else
      render json: Item.most_sold
    end
  end

end
