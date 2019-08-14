class EndItemsController < ApplicationController

	def index
		@newitems = Item.page(params[:page]).per(4).all
		respond_to do |format|
      		format.html
      		format.js
    	end
		@cheapitems = Item.where("price <= ?", 1000).page(params[:page]).per(4)
		@fewitems = Item.where("stock <= ?", 3).page(params[:page]).per(4)
		@allitems = Item.all
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