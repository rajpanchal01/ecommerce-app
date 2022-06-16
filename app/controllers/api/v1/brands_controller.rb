module Api
    module V1
      class BrandsController < ApplicationController
        before_action :authorize
  
        def index
          @brands = Brand.order('created_at DESC')
          render json: {status: 'SUCCESS', message: 'Loaded brand', data:@brands}, status: :ok
        end
  
        def show
          @brand = Brand.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded brand', data:@brand}, status: :ok
        end
  
        def create
          @brand = Brand.new(brand_params)
  
          if @brand.save
            render json: {status: 'SUCCESS', message: 'saved', data:@brand}, status: :ok
          else
            render json: {status: 'Error', message: 'not saved', data:@brand.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @brand = Brand.find(params[:id])
  
          if @brand.update_attributes(brand_params)
            render json: {status: 'SUCCESS', message: 'brand is updated', data:@brand}, status: :ok
          else
            render json: {status: 'Error', message: 'brand is not updated', data:@brand.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @brand = Brand.find(params[:id])
          @brand.destroy
  
          render json: {status: 'SUCCESS', message: 'brand successfully deleted', data:@brand}, status: :ok
        end
  
        private
          def brand_params
            params.permit(:name)
          end
  
      end
    end
  end