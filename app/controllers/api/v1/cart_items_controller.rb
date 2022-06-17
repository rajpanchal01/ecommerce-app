module Api
  module V1
    class CartItemsController < ApplicationController
      before_action :set_cart_item, only: %i[ show update destroy ]

      # GET /cart_items
      def index
        if params[:cart_id]
          @cart_items=CartItem.where(cart_id: params[:cart_id])
        else
          @cart_items = CartItem.all
        end

        render json: @cart_items
      end

      # GET /cart_items/1
      def show
        render json: @cart_item
      end

      # POST /cart_items
      def create
        @cart_item=CartItem.where(cart_id: params[:cart_id],product_id: params[:product_id])
        if @cart_item!=[]
          #x=@cart_item[:item_quantity]
          @cart_item[0].increment!(:item_quantity, 1)
          #p @cart_item[0].item_quantity
          #@cart_item.update_attributes(item_quantity: @cart_item[0].item_quantity+1)
          #puts CartItem.find(@cart_item)
          #@cart_item.update_attribute(:items_quanity, @cart_item +=1 )
          render json: @cart_item , status: :ok
        else
          @cart_item = CartItem.new(cart_item_params)
  
          if @cart_item.save
            render json: @cart_item, status: :created
          else
            render json: @cart_item.errors, status: :unprocessable_entity
          end

        end
      end

      # PATCH/PUT /cart_items/1
      def update
        if @cart_item.update(cart_item_params)
          render json: @cart_item
        else
          render json: @cart_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cart_items/1
      def destroy
        @cart_item.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart_item
          @cart_item = CartItem.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cart_item_params
          params.permit(:item_quantity,:cart_id,:product_id)
        end
    end
  end
end