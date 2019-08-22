class EndPurchasesController < ApplicationController
  before_action :is_sale_check_filter

  include DataFormat

  def index
    cart_items = CartItem.where(end_user_id: current_end_user['id'])
    @carts = cart_items_format_array(cart_items)
    @addresses = Address.where(end_user_id: current_end_user['id'].to_i)
    @user = EndUser.find(current_end_user['id'])
  end

  def create
    tax = 108
    cart_items = CartItem.where(end_user_id: current_end_user[:id])

    is_able_purchase_list = stock_check_list(CartItem.where(end_user_id: current_end_user[:id]))

    if is_sale(is_able_purchase_list)
      total_price = price_sum(tax, cart_items)
      shipping_charge = shipping_charge_calc(params, cart_items)
      #購入履歴を作成
      purchase_history = PurchaseHistory.create(end_user_id: current_end_user[:id],total_price: total_price, shipping_charge: shipping_charge, consumption_tax: tax)

      #購入履歴に紐づく購入詳細を作成
      array = purchase_details_array(purchase_history['id'], cart_items, params)
      PurchaseDetail.import array

      #販売個数を商品に反映
      purchase_amount_list = request_purchase_amount_list(cart_items)
      purchase_amount_list.each do |item_id, amount|
        item = Item.find(item_id.to_i)
        item['stock'] -= amount
        item.save
      end

      #カート初期化
      cart_items.destroy_all

      redirect_to end_purchase_histories_path
    else
      redirect_to end_cart_items_path
    end

  end

  private
    def is_sale_check_filter
      unless is_sale(stock_check_list(CartItem.where(end_user_id: current_end_user[:id])))
        redirect_to end_cart_items_path
      end
    end

end
