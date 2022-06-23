module Api
  module V1    
    class WishlistsController < ApplicationController
      before_action :set_wishlist, only: %i[ show update destroy ]
      before_action :set_user_id
      # GET /wishlists
      def index
        if params[:user_id]
          @wishlists = Wishlist.find_by(user_id: params[:user_id])
        else
        @wishlists = Wishlist.all
        end
        render json: @wishlists
      end

      # GET /wishlists/1
      def show
        render json: @wishlist
      end

      # POST /wishlists
      def create
        if !Wishlist.find_by(user_id: params[:user_id])
          @wishlist = Wishlist.new(wishlist_params)
            if @wishlist.save
              render json: @wishlist, status: :created
            else
              render json: @wishlist.errors, status: :unprocessable_entity
            end
        end
      end

      # PATCH/PUT /wishlists/1
      def update
        if @wishlist.update(wishlist_params)
          render json: @wishlist
        else
          render json: @wishlist.errors, status: :unprocessable_entity
        end
      end

      # DELETE /wishlists/1
      def destroy
        @wishlist.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_wishlist
          @wishlist = Wishlist.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def wishlist_params
          params.permit(:user_id)
        end
        def set_user_id
          params[:user_id]=current_user.id
        end
    end
  end 
end