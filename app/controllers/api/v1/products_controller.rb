module Api
    module V1
      class ProductsController < ApplicationController
  
        def index
          @products = Product.order('created_at DESC')
          render json: @products,adapter: :json, status: :ok
        end
  
        def show
          @product = Product.find(params[:id])
          render json: @product , status: :ok
        end
  
        def create
          @product = Product.new(product_params)
         # p @product.posters
          if @product.save
            render json: ProductSerializer.new(@product).serializable_hash[:data][:attributes], status: :ok
          else
            render json: {status: 'Error', message: 'Product is not saved', data:@product.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @product = Product.find(params[:id])
  
          if @product.update_attributes(product_params)
            render json: {status: 'SUCCESS', message: 'Product is updated', data:@product}, status: :ok
          else
            render json: {status: 'Error', message: 'Product is not updated', data:@product.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @product = Product.find(params[:id])
          @product.destroy
  
          render json: {status: 'SUCCESS', message: 'successfully deleted', data:@product}, status: :ok
        end
  
        private
          def product_params
            params.permit(:name, :description,:price,:sub_category_id,:brand_id, posters: [])
          end
  
      end
    end
  end