module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[ show update destroy ]

      # GET /orders
      def index
        if params[:user_id]
          @orders= Order.where(user_id: params[:user_id])
        else
          @orders = Order.all
  
        end
          render json: @orders

      end

      # GET /orders/1
      def show
        render json: @order
      end

      # POST /orders
      def create
        @order = Order.new(order_params)

        if @order.save
          render json: @order, status: :created
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orders/1
      def update
        if @order.update(order_params)
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /orders/1
      def destroy
        @order.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_params
          params.permit(:total_amount,:user_id,:user_address_id)
        end
    end
  end
end