module Api
    module V1
      class ProductsController < ApplicationController
        
        def index
          @products=Product.all
          # if params[:discount]=="high"
          #   @products=@products.where()
          # end
          if params[:seller_id]
            @products=@products.where(seller_id: params[:seller_id])
          end
          if params[:sub_category_id]
            @products=@products.where(sub_category_id: params[:sub_category_id])
          end
          if params[:sub_category]
            @name=SubCategory.find_by(name: params[:sub_category])
            @products=@products.where(sub_category_id: @name.id)
          end
          if params[:brand_id]
            @products=@products.where(brand_id: params[:brand_id])
          end
          if params[:brand]
            @name=Brand.find_by(name: params[:brand])
            @products=@products.where(brand_id: @name.id)
          end
          render json: @products,adapter: :json, status: :ok
        end
        def rating
           if params[:rating]
            #Product.find(34).reviews.average(:rating).to_i
            @products=Product.includes(:reviews).where(reviews: {rating: params[:rating]})
            render json: @products
           end
        end
        def search
          @a=params[:search]
          @products = Product.search_by_query(@a)
          render json: @products
        end
        def show
          @product = Product.find(params[:id])
          render json: @product , status: :ok
        end
  
        def create
          @product = Product.new(product_params)
          # Inventory.create!(product_id: @product.id)
         #p @product.posters
          if @product.save
            Inventory.create!(product_id: @product.id)
            render json: @product, status: :ok
          else
            render json: {status: 'Error', message: 'Product is not saved', data:@product.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @product = Product.find(params[:id])
  
          if @product.update(product_params)
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
            params.permit(:name, :description,:price,:sub_category_id,:brand_id,:seller_id,:discount, posters: [])
          end
  
      end
    end
  end