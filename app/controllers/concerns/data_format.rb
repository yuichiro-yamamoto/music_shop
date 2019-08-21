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

    def purchase_details_array(purchase_history_id, cart_items_model, params)
      array = []
      cart_items_model.each do |cart|
        address = Address.find(params["address_name#{cart['id']}"].to_i)
        array << PurchaseDetail.new(
            :purchase_history_id => purchase_history_id,
            :shipping_status => "受付",
            :sale_number => cart['purchase_quantity'],
            :price_history => cart.item['price'],
            :item_name_history => cart.item['item_name'],
            :artist_name_history => Artist.find(cart.item['artist_id']),
            :method_of_payment => params['method_of_payment'],
            :item_image_id => cart.item['item_image_id'],
            :postal_code_history => address['postal_code'],
            :address_history => address['address'],
            :telephone_number_history => address['telephone_number'],
            :name_history => address['name']
        )
      end

      array

    end

    def price_sum(tax, cart_model)
      total_price = 0
      cart_model.each do |cart|
        total_price += cart.item['price'] * cart['purchase_quantity']
      end

      (total_price * tax / 100).ceil
    end

    def shipping_charge_calc(params, cart_items_model)

      list = {}
      cart_items_model.each do |cart|
        puts params["address_name#{cart['id']}"]

        list[params["address_name#{cart['id']}"]] = true
      end

      500 * list.length
    end


  end
end