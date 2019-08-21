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

    total_price = price_sum()
    shipping_charge = shipping_charge_calc(params, cart_items)

    purchase_history = PurchaseHistory.create(end_user_id: current_end_user[:id],total_price: total_price, shipping_charge: shipping_charge, consumption_tax: tax)

    purchase_array = []
    purchases.each do |purchase|
      item = Item.find(purchase.item_id)
      artist = Artist.find(local_item.artist_id)
      @purchase_detail.item_name_history = item.item_name
      @purchase_detail.artist_name_history = artist.artist_name
      @purchase_detail.sale_namber = purchase.purchase_quantity
      @purchase_detail.price_history = item.price
      @purchase_detail.save
    end

    addresses = Address.where(end_user_id: current_end_user[:id])
    @address = PurchaseDetail.new
    addresses.each do |address|
      @address.name_history = address.name
      @address_detail.postal_code_history = address.postal_code
      @address_detail.address_history = address.address
      @address_detail.telephone_number_history = address.telephone_number
    end

    shipping_status = PurchaseDetail.create(purchase_params)

    redirect_to end_items_path
  end

end
