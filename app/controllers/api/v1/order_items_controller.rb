module Api
  module V1
    class OrderItemsController < ApplicationController
      before_action :set_order_item, only: %i[ show update destroy ]

      # GET /order_items
      def index
        @order_items = OrderItem.all
        if params[:seller_id]
            a=Seller.find(params[:seller_id]).products.pluck(:id)
            @order_items =@order_items.where(:product_id=>a)
            # render json: @order_items
        end
        if params[:order_id]
            @order_items=@order_items.where(:order_id=>params[:order_id])
        end
        render json: @order_items
      end

      # GET /order_items/1
      def show
        render json: @order_item
      end

      # POST /order_items
      def create
        @order_item = OrderItem.new(order_item_params)
        quantity_drop=@order_item.quantity
        # @order_item.product.id
        Inventory.find_by(product_id: @order_item.product.id).decrement!(:quantity,quantity_drop.to_i )
        if @order_item.save
          render json: @order_item, status: :created
        else
          render json: @order_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /order_items/1
      def update
        if @order_item.update(order_item_params)
          render json: @order_item
        else
          render json: @order_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /order_items/1
      def destroy
        @order_item.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order_item
          @order_item = OrderItem.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_item_params
          params.permit(:quantity,:order_id,:product_id)
        end
    end
  end 
end 