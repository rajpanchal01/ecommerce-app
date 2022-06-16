
# It should verify when user add product in cart it shows all the cart of the same user and same for when they login cart shows the same user's cart iteams which are added before

module ProductsHelper

    def product_author(product)
      user_signed_in? && current_user.id == product.user_id
    end
  
  end