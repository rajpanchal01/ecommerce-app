module ApplicationHelper

    def cart_count_over_one
      if @cart.order_items.count > 0
        return "<span class='tag is-dark'>#{@cart.order_items.count}</span>".html_safe
      end
    end
  
    def cart_has_items
      return @cart.order_items.count > 0
    end
  end