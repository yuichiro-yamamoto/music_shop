class EndReviewsController < ApplicationController

	def create
		item = Item.find(params[:end_item_id])
		review = current_user.reviews.new(end_review_params)
		review.item_id = item.id
		review.save
		redirect_to item_path(item)
	end
	private
		def end_review_params
			params.require(:end_review).permit(:end_user_id, :item_id, :review)
		end
end