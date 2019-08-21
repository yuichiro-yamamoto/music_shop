class AdminPurchaseHistoriesController < ApplicationController
  def index
    @purchase_histories = PurchaseDetail.all
  end
  def show
    @purchase_history = PurchaseDetail.find(params[:id])
  end
  def update
    purchase_history = PurchaseDetail.update
    purchase_history.update(purchase_history_params)
  end
  def search
    @purchase_histories = PurchaseDetail.where('shipping_status LIKE ?', "%#{params[:shipping_status]}" )
  end

  private
  def purchase_history_params
      params.repuire(:purchase_details).permit(:shipping_status)
  end
end
