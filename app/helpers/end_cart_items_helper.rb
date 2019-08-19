module EndCartItemsHelper
	def getModel(cart_item_model)
		array = []

		cart_item_modle.each do |cart|
			 pq = cart['purchase_quantity']
			 name = cart["item_id"].items["item_name"]
			 price = cart["item_id"].items["price"]
			 condition = cart["item_id"].items["sale_condition"]
			 image = cart["item_id"].items["item_image_id"]
			 artist = cart["item_id"].items[artist_id].artists["artist_name"]

			 list = {}
			 list["purchase_quantity"] = pq
			 lits["name"] = name
			 list["price"] = price
			 list["condition"] = condition
			 lits["image"] = image
			 list["artist"] = artist
			 array.push(list)
		end

 		#[{list},{list},{list}]
		return  array
	end
end
