module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :set_payment, only: %i[ show update destroy ]
      before_action :set_user_id
      # GET /payments
      def index
        @payments = Payment.all

        render json: @payments
      end

      # GET /payments/1
      def show
        render json: @payment
      end

      # POST /payments
      def create
        @payment = Payment.new(payment_params)

        if @payment.save
          render json: @payment, status: :created, location: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /payments/1
      def update
        if @payment.update(payment_params)
          render json: @payment
        else
          render json: @payment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /payments/1
      def destroy
        @payment.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_payment
          @payment = Payment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def payment_params
          params.require(:payment).permit(:amount, :status,:order_id,:user_id)
        end
        def set_user_id
          params[:user_id]=current_user.id
        end
    end
  end 
end