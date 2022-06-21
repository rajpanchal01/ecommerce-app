module Api
    module V1
      class UserOtpsController < ApplicationController
        before_action :set_user_otp, only: %i[ show update destroy ]
  
        # GET /user_otps
        def index
          if params[:user_id]
            @user_otps=UserOtp.where(user_id: params[:user_id])
          else
          @user_otps = UserOtp.all
          end
  
          render json: @user_otps
        end
  
        # GET /user_otps/1
        def show
          render json: @user_otp
        end
  
        # POST /user_otpes
        def create
          @user_otp = Userotp.new(user_otp_params)
          if @user_otp.save
            render json: @user_otp, status: :created
          else
            render json: @user_otp.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /user_otpes/1
        def update
          if @user_otp.update(user_otp_params)
            render json: @user_otp
          else
            render json: @user_otp.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /user_otpes/1
        def destroy
          @user_otp.destroy
        end
  
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_user_otp
            @user_otp = Userotp.find(params[:id])
          end
  
          # Only allow a list of trusted parameters through.
          def user_otp_params
            params.permit(:otp_line1, :otp_line2, :city, :country, :postal_code, :mobile_no,:user_id,:full_name)
          end
      end
    end 
  end