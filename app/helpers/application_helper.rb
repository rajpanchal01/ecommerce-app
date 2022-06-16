module ApplicationHelper


    # when user add iteam in a cart, iteam must be 1 or more than 1 selected compulsory.

    def cart_count_over_one
      if @cart.order_items.count > 0
        return "<span class='tag is-dark'>#{@cart.order_items.count}</span>".html_safe
      end
    end
  
    def cart_has_items
      return @cart.order_items.count > 0
    end
  end