module Api
    module V1

        class UsersController < ApplicationController
            def index
                @users = User.all
                render json: {data: @users},status: :ok
            end
            def create

                @user_data1 =User.find_by(email: user_params[:email])
                @user_data2 =User.find_by(mobile_number: user_params[:mobile_number])
                if (!@user_data1) && (!@user_data2) 
                    @user= User.create(user_params)
                    if @user.valid?
                        token = encode_token({user_id: @user.id})
                        render json:  {user: @user,token: token}, status: :ok
                    else 
                        render json: {error: "Invalid username or password"}, status: :unprocessable_entity
                        
                    end
                else
                   render json: {error: "Email or mobile number already exist!"}, status: :unprocessable_entity
                 end
            end
            def login
                @user =User.find_by(email: user_params[:email])
                p @user
                if @user && @user.authenticate(user_params[:password])
                    token = encode_token({user_id: @user.id})
                    render json:  {user: @user,token: token}, status: :ok
                else
                    render json: {error: "Invalid username or password"}, status: :unprocessable_entity
                end
            end
            def logout
                
            end
            private
            def user_params
                params.permit(:email,:password,:name,:mobile_number)
            end
        end
    end
    
end
##<ApplicationController:0x00000000030430>
##eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws