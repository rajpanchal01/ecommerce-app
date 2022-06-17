class UserMailer < ApplicationMailer
    def new_order_email
        # @order = params[:order]
    
        mail(to:"kristalmehta10@gmail.com" , subject: "You got a new order!")
      end
end
