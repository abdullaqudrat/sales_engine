class Api::V1::Merchants::BossModeController < ApplicationController

  def index
    render json: Merchant.customers_with_pending_invoices(params[:id])
  end

end
