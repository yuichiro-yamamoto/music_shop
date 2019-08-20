class EndPurchasesController < ApplicationController
  def index
      @carts = CartItem.where(end_user_id: current_end_user[:id])
      @addresses = Address.where(end_user_id: current_end_user[:id])
      @carts.each do |cart|
      item = Item.find(cart.item_id)
      artist =Artist.find(item.artist_id)
        purchase_quantity = cart.purchase_quantity
        name = item.item_name
        price = item.price
        condition = item.sale_condition
        image = item.item_image_id
        artist = artists.artist_name
      end
  end
  def create
      purchases = CartItem.where(end_user_id: current_end_user[:id])
      @purchase_detail = PurchaseDetail.new
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
private
  def purchase_params
  	  params.require(:purchase_detail).permit(:shipping_status,)
  end
end
