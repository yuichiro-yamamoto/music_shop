class EndItemsController < ApplicationController

	def index
		@new_items = Item.page(params[:page]).per(4)
		@cheap_items = Item.where("price <= ?", 1000).page(params[:page]).per(4)
		@few_items = Item.where("stock <= ?", 3).page(params[:page]).per(4)
		@all_items = Item.page(params[:page]).per(20)
		@ranking = Item.order("sale_number DESC").limit(10)
	end

	def search_result
	end

	def search
	end

	def show
		@item = Item.find(params[:id])
		@review = Review.new
	end

end