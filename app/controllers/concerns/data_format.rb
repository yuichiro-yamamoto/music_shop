module DataFormat
  extend ActiveSupport::Concern

  included do
    def cart_items_format_array(cart_items_model)
      array = []
      cart_items_model.each do |cart|
        list = {}
        item = Item.find(cart["item_id"])
        list['artist'] = Artist.find(item["artist_id"])['artist_name']
        list['purchase_quantity'] = cart["purchase_quantity"]
        list['id'] = cart["id"]
        list['name'] = item["item_name"]
        list['price'] = item["price"]
        list['condition'] = item["sale_condition"]
        list['item'] = item
        array.push(list)
      end
      array
    end
  end
end