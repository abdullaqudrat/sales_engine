class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    merchant = Merchant.find(merchant_params[:id])
    render json: Merchant.favorite_customer(merchant)
  end

  private
    def merchant_params
      params.permit(:id)
    end
end
