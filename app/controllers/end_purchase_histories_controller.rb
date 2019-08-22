class EndPurchaseHistoriesController < ApplicationController
  def index
    purchase_histories = PurchaseHistory.where(end_user_id: current_end_user['id'])
    puts '---------------------'
    puts purchase_histories.inspect
    purchase_history_array = []
    purchase_histories.each do |history|
      detail_array = PurchaseDetail.where(purchase_history_id: history['id'])
      puts detail_array.inspect
      purchase_history_array.push(detail_array)
    end
    @purchase_history_array =  purchase_history_array
  end
end
