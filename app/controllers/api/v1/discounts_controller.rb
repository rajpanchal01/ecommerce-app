module Api
    module V1
      class DiscountsController < ApplicationController
  
        def index
          @discounts = Discount.order('created_at DESC')
          render json: @discounts, status: :ok
        end
  
        def show
          @discount = Discount.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded Inventories', data:@discount}, status: :ok
        end
  
        def create
          @discount = Discount.new(discount_params)
  
          if @discount.save
            render json: {status: 'SUCCESS', message: 'inventory is saved', data:@discount}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not saved', data:@discount.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @discount = Discount.find(params[:id])
  
          if @discount.update_attributes(discount_params)
            render json: {status: 'SUCCESS', message: 'inventory is updated', data:@discount}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not updated', data:@discount.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @discount = Discount.find(params[:id])
          @discount.destroy
  
          render json: {status: 'SUCCESS', message: 'inventory successfully deleted', data:@discount}, status: :ok
        end
  
        private
          def discount_params
            params.permit(:name,:start_date,:end_date,:offer_type,:offer_dicount,:image)
          end
  
      end
    end
  end