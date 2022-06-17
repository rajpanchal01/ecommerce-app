module Api
    module V1
      class MainCategoriesController < ApplicationController
  
        def index
          @categories = MainCategory.order('created_at DESC')
          render json: @categories, status: :ok
        end
  
        def show
          @category = MainCategory.find(params[:id])
          render json: @category, status: :ok
        end
  
        def create
          @category = MainCategory.new(category_params)
  
          if @category.save
            render json: {status: 'SUCCESS', message: 'categories is saved', data:@category}, status: :ok
          else
            render json: {status: 'Error', message: 'Categories is not saved', data:@category.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @category = MainCategory.find(params[:id])
  
          if @category.update(category_params)
            render json: {status: 'SUCCESS', message: 'Category is updated', data:@category}, status: :ok
          else
            render json: {status: 'Error', message: 'Category is not updated', data:@category.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @category = MainCategory.find(params[:id])
          @category.destroy
  
          render json: {status: 'SUCCESS', message:'Categories successfully deleted', data:@category}, status: :ok
        end
  
        private
          def category_params
            params.permit(:name, :about,:image)
          end
  
      end
    end
  end