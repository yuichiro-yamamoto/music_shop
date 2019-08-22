class EndItemsController < ApplicationController

	def index
		@tax_rate = "1.08"
		@new_items = Item.includes(:artist).page(params[:page]).per(4).order(id: "DESC")
		@cheap_items = Item.includes(:artist).where("price <= ?", (BigDecimal("1000") * BigDecimal(@tax_rate)).ceil).page(params[:page]).per(4).order(id: "DESC")
		@few_items = Item.includes(:artist).where("stock <= ?", 3).page(params[:page]).per(4).order(id: "DESC")
		@all_items = Item.includes(:artist).page(params[:page]).per(20).order(id: "DESC")
		@ranking = Item.includes(:artist).order(sale_number: "DESC").limit(10)
	end

	def search
	end

	def show
		@tax_rate = "1.08"
		@item = Item.find(params[:id])
		@review = Review.new
		@reviews = Review.includes(:artist).page(params[:page]).per(5).order(id: "DESC")
	end
end
