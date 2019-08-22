module EndCartItemsHelper
  def is_sale(is_able_purchase_list)
    is_sale = true
    is_able_purchase_list.each do |cart_id, flag|
      unless flag
        is_sale = flag
        break
      end
    end

    is_sale
  end
end