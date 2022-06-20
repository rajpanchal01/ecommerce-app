module Api
    module V1
      class SubCategoriesController < ApplicationController
  
        def index
          @name=MainCategory.find_by(name: params[:main_category])
          if params[:main_category_id]
            @sub_categories=SubCategory.where(main_category_id: params[:main_category_id])
          elsif params[:main_category]
            @sub_categories=SubCategory.where(main_category_id: @name.id)
          else
          @sub_categories = SubCategory.order('created_at DESC')
          end
          render json: @sub_categories, status: :ok

        end
  
        def show
          @sub_category = SubCategory.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded!', data:@sub_category}, status: :ok
        end
  
        def create
          @sub_category = SubCategory.new(sub_category_params)
  
          if @sub_category.save
            render json: {status: 'SUCCESS', message: 'created', data:@sub_category}, status: :ok
          else
            render json: {status: 'Error', message: 'Not saved!', data:@sub_category.errors}, status: :unprocessable_entity
          end
        end
  
        def update
          @sub_category = SubCategory.find(params[:id])
  
          if @sub_category.update(sub_category_params)
            render json: {status: 'SUCCESS', message: 'updated', data:@sub_category}, status: :ok
          else
            render json: {status: 'Error', message: 'not updated', data:@sub_category.errors}, status: :unprocessable_entity
          end
        end
  
        def destroy
          @sub_category = SubCategory.find(params[:id])
          @sub_category.destroy
  
          render json: {status: 'SUCCESS', message: 'successfully deleted', data:@sub_category}, status: :ok
        end
  
        private
          def sub_category_params
            params.permit(:name, :main_category_id)
          end
  
      end
    end
  end