class EndCartItemsController < ApplicationController
  def index
  	@carts = CartItem.where(end_user_id: current_end_user[:id])
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
  def update
  	cart = CartItem.where(end_user_id: current_end_user[:id])
  	cart.update(cart_params)
  	redirect_to current_end_cart_items
  end

  def destroy
  	cart = CartItem.where(end_user_id: current_end_user[:id])
  	cart.destroy
  	redirect_to current_end_cart_items
  end

  def add
    cart = CartItem.new
    cart['item_id'] = cart_params['item_id']
    cart['user_id'] = current_end_user['id']
    cart['purchase_quantity'] = cart_params['purchase_quantity']
  	cart.save
  end

  private
  def cart_params
  	  params.require(:cart_items).permit(:purchase_quantity, :item_id)
  end
end
