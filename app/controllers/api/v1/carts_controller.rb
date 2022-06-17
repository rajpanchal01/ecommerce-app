module Api
  module V1    
    class CartsController < ApplicationController
      before_action :set_cart, only: %i[ show update destroy ]

      # GET /carts
      def index
        puts "here"
        UserMailer.new_order_email.deliver_later
        puts "heree"
        if params[:user_id]
            @carts = Cart.where(user_id: params[:user_id])
        else
          @carts = Cart.all
        end
        render json: @carts
      end

      # GET /carts/1
      def show
        render json: @cart
      end

      # POST /carts
      def create
        if !Cart.find_by(user_id: params[:user_id])
          @cart = Cart.new(cart_params)
          if @cart.save
            render json: @cart, status: :created
          else
            render json: @cart.errors, status: :unprocessable_entity
          end
        else
          render json: {masssage: "User already exist with cart"}, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /carts/1
      def update
        if @cart.update(cart_params)
          render json: @cart
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # DELETE /carts/1
      def destroy
        @cart.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart
          @cart = Cart.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cart_params
          params.permit(:user_id)
        end
    end
  end 
end 