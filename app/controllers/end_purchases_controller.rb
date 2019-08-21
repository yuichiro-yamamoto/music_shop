class EndPurchasesController < ApplicationController
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

    total_price = price_sum(tax, cart_items)
    shipping_charge = shipping_charge_calc(params, cart_items)
    purchase_history = PurchaseHistory.create(end_user_id: current_end_user[:id],total_price: total_price, shipping_charge: shipping_charge, consumption_tax: tax)

    array = purchase_details_array(purchase_history['id'], cart_items, params)
    PurchaseDetail.import array

    cart_items.destroy_all

    redirect_to end_items_path
  end

end
