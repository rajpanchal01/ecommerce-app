module Api
    module V1
      class InventoriesController < ApplicationController
  
        def index
          @inventories = Inventory.order('created_at DESC')
          render json: {status: 'SUCCESS', message: 'Loaded Inventories', data:@inventories}, status: :ok
        end
  
        def show
          @inventory = Inventory.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded Inventories', data:@inventory}, status: :ok
        end
  
        def create
          @inventory = Inventory.new(inventory_params)
  
          if @inventory.save
            render json: {status: 'SUCCESS', message: 'inventory is saved', data:@inventory}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not saved', data:@inventory.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @inventory = Inventory.find(params[:id])
  
          if @inventory.update_attributes(inventory_params)
            render json: {status: 'SUCCESS', message: 'inventory is updated', data:@inventory}, status: :ok
          else
            render json: {status: 'Error', message: 'inventory is not updated', data:@inventory.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @inventory = Inventory.find(params[:id])
          @inventory.destroy
  
          render json: {status: 'SUCCESS', message: 'inventory successfully deleted', data:@inventory}, status: :ok
        end
  
        private
          def inventory_params
            params.permit(:quantity, :product_id)
          end
  
      end
    end
  end