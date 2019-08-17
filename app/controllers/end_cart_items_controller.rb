class EndCartItemsController < ApplicationController
  def index
  	@carts = CartItem.all
  end
  def update
  	cart = CartItem.find(params[:id])
  	cart.update(cart_params)
  	redirect_to current_cart_items
  end
  def destroy
  	cart = CartItem.find(params[:id])
  	cart.destroy
  	redirect_to current_cart_items
  end
  def add
  	@cart = CartItem.new
  	@cart.save(params[:id])
  end

  private
  def cart_params
  	  params.repuire(:cart_items).permit(:purchase_quantity, :item_id)
  end
end
