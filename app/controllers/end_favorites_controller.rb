class EndFavoritesController < ApplicationController
	def create
            item = Item.find(params[:end_item_id])
            favorite = current_user.favorites.new(end_item_id: end_item.id)
            favorite.save
            redirect_to end_item_path(item)
        end
        def destroy
            item = Item.find(params[:end_item_id])
            favorite = current_user.favorites.find_by(end_item_id: end_item.id)
            favorite.destroy
            redirect_to end_item_path(item)
        end
end
