module Api
  module V1
    class OrderIteamsController < ApplicationController
      before_action :set_order_iteam, only: %i[ show update destroy ]

      # GET /order_iteams
      def index
        @order_iteams = OrderIteam.all

        render json: @order_iteams
      end

      # GET /order_iteams/1
      def show
        render json: @order_iteam
      end

      # POST /order_iteams
      def create
        @order_iteam = OrderIteam.new(order_iteam_params)

        if @order_iteam.save
          render json: @order_iteam, status: :created, location: @order_iteam
        else
          render json: @order_iteam.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /order_iteams/1
      def update
        if @order_iteam.update(order_iteam_params)
          render json: @order_iteam
        else
          render json: @order_iteam.errors, status: :unprocessable_entity
        end
      end

      # DELETE /order_iteams/1
      def destroy
        @order_iteam.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order_iteam
          @order_iteam = OrderIteam.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_iteam_params
          params.require(:order_iteam).permit(:quantity)
        end
    end
  end 
end 