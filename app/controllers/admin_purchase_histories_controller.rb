class AdminPurchaseHistoriesController < ApplicationController
  def index
    @purchase_histories = PurchaseHistory.all
  end
  def show
    @purchase_history = PurchaseHistory.find(params[:id])
  end
  def update
    purchase_history = PurchaseHistory.update
    purchase_history.update(purchase_history_params)
  end
  def search
    purchase_history = PurchaseHistory.find
  end

  private
  def purchase_history_params
      params.repuire(:purchase_details).permit(:shipping_status)
  end
end
