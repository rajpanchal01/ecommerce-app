class UserMailer < ApplicationMailer
    def new_order_email
        # @order = params[:order]
    
        mail(to:"kristalmehta10@gmail.com" , subject: "You got a new order!")
    end
    def new_user_otp_email
      @user=params[:mail]
      @otp = UserOtp.find_by(user_id: @user.id)
      #@user.email 
      mail(to: "rajpanchal2810@gmail.com" , subject: "Welcome to Our world!")
    end
end
