module Api
    module V1
      class DiscountItemsController < ApplicationController
  
        def index
          if params[:discount_id]
            @discount_items=DiscountItem.where(discount_id: params[:discount_id])
          end
          if params[:offer_type]
            @discount_items=DiscountItem.joins(:discount).order("offer_dicount DESC").where(discounts: { offer_type: params[:offer_type] })
          else
            @discount_items = DiscountItem.order("created_at DESC")
          end

          # @discount_items=DiscountItem.joins(:discount).order(DiscountItem.offer_dicount)#.where(discount[:offer_type]=>"direct")
          #@discount_items = DiscountItem.all
          

          render json: @discount_items, status: :ok
        end
  
        def show
          @discount_items = DiscountItem.find(params[:id])
          render json:  @discount_items, status: :ok
        end
  
        def create
          @discount_item = DiscountItem.new(discount_item_params)
  
          if @discount_item.save
            render json: {status: 'SUCCESS', message: 'inventory is saved', data:@discount_item}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not saved', data:@discount_item.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @discount_item = DiscountItem.find(params[:id])
  
          if @discount_item.update_attributes(discount_item_params)
            render json: {status: 'SUCCESS', message: 'inventory is updated', data:@discount_item}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not updated', data:@discount_item.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @discount_item = DiscountItem.find(params[:id])
          @discount_item.destroy
  
          render json: {status: 'SUCCESS', message: 'inventory successfully deleted', data:@discount_item}, status: :ok
        end
  
        private
          def discount_item_params
            params.permit(:discount_id,:product_id)
          end
  
      end
    end
  end