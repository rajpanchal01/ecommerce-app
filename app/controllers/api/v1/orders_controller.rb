module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[ show update destroy ]
      before_action :set_user_id,only: %i[ show create ]
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
        if @order = Order.save(order_params) # this will save the order 
       
          current_user.cart.cart_items.each do |cart_item|
             # using the bang (!) to save to the DB and raise any errors
             # rather than failing silently
             @order_item=@order.order_items.create!(         
                product_id: cart_item.product_id,
                quantity:   cart_item.item_quantity 
             )
             quantity_drop=@order_item.quantity
             # @order_item.product.id
             Inventory.find_by(product_id: @order_item.product.id).decrement!(:quantity,quantity_drop.to_i )
             end
             #delete from cart
          current_user.cart.cart_items.destroy_all
           render json: @order ,notice: 'Order was successfully created.'
       else
           render json:  {massage: 'Something went wrong saving the order.'}
       end 
        # @order = Order.new(order_params)

        # if @order.save
        #   render json: @order, status: :created
        # else
        #   render json: @order.errors, status: :unprocessable_entity
        # end
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
          params.permit(:total_amount,:user_id,:user_address_id,:status)
        end
        def set_user_id
          params[:user_id]=current_user.id
        end
    end
  end
end