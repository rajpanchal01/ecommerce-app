module Api
  module V1    
    class WishlistItemsController < ApplicationController
      before_action :set_wishlist_item, only: %i[ show update destroy ]

      # GET /wishlist_items
      def index
        if params[:wishlist_id]
          @wishlist_items = WishlistItem.where(wishlist_id: params[:wishlist_id])
        else
          @wishlist_item = WishlistItem.all
        end
        render json: @wishlist_items
      end

      # GET /wishlist_items/1
      def show
        render json: @wishlist_item
      end

      # POST /wishlist_items
      def create
        @wishlist_item=WishlistItem.where(wishlist_id: params[:wishlist_id],product_id: params[:product_id])
        if @wishlist_item!=[]
          @wishlist_item[0].increment!(:item_quantity, 1)
          render json: @wishlist_item , status: :ok
        else
            @wishlist_item = WishlistItem.new(wishlist_item_params)

          if @wishlist_item.save
            render json: @wishlist_item, status: :created
          else
            render json: @wishlist_item.errors, status: :unprocessable_entity
          end
        end
      end

      # PATCH/PUT /wishlist_items/1
      def update
        if @wishlist_item.update(wishlist_item_params)
          render json: @wishlist_item
        else
          render json: @wishlist_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /wishlist_items/1
      def destroy
        @wishlist_item.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_wishlist_item
          @wishlist_item = WishlistItem.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def wishlist_item_params
          params.fetch(:wishlist_id,:product_id)
        end
    end
  end 
end 