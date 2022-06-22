module Api
    module V1
      class SellersController < ApplicationController
        before_action :set_seller, only: %i[ show update destroy ]
  
        # GET /orders
        #OrderItem.where(:product_id=>a)
        # a=Seller.find(1).products.pluck(:id)
        def index
          if params[:user_id]
            @sellers= Seller.where(user_id: params[:user_id])
          else
            @sellers = Seller.all
    
          end
            render json: @sellers
  
        end
        
        # GET /orders/1
        def show
          render json: @seller
        end
  
        # POST /orders
        def create
          @seller = Seller.new(seller_params)
        
          if @seller.save
            # action_item :approve, only: :index do
            #     link_to "Approve", some_path
            #   end
            User.find(params[:user_id]).update_attribute(:status,1)
            render json: @seller, status: :created
          else
            render json: @seller.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /orders/1
        def update
          if @seller.update(seller_params)
            render json: @seller
          else
            render json: @seller.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /orders/1
        def destroy
          @seller.destroy
        end
  
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_seller
            @seller = Seller.find(params[:id])
          end
  
          # Only allow a list of trusted parameters through.
          def seller_params
            params.permit(:user_id,:gst_id,:pan_id,:seller_location)
          end
      end
    end
  end