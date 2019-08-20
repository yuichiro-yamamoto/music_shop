class EndCartItemsController < ApplicationController
  def index
  	@carts = CartItem.where(end_user_id: current_end_user[:id])
  end
  def update
  	carts = CartItem.where(end_user_id: current_end_user[:id])
  	cart.update(cart_params)
  	redirect_to current_end_cart_items
  end
  def destroy
  	carts = CartItem.where(end_user_id: current_end_user[:id])
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
