class EndReviewsController < ApplicationController

	def create
		post_image = PostImage.find(params[:post_image_id])
    	comment = current_user.post_comments.new(post_comment_params)
    	comment.post_image_id = post_image.id
    	comment.save
    	redirect_to post_image_path(post_image)
	end

private
	def review_params
  		params.require(:review).permit(:end_user_id, :end_review_id,)
	end
end
end