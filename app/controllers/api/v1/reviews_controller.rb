module Api
    module V1
      class ReviewsController < ApplicationController
      before_action :set_review, only: %i[ show update destroy ]

      # GET /reviews
      def index
        if params[:product_id] 
          @reviews=Review.where(product_id: params[:product_id]).order('rating DESC')
        elsif params[:user_id]
          @reviews=Review.where(user_id: params[:user_id]).order('rating DESC')
        else
          @reviews = Review.order('rating DESC')
        end
        render json: @reviews,status: :ok

      end

      # GET /reviews/1
      def show
        render json: @review
      end

      # POST /reviews
      def create
        @review = Review.new(review_params)

        if @review.save
          render json: @review, status: :created
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /reviews/1
      def update
        if @review.update(review_params)
          render json: @review
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end

      # DELETE /reviews/1
      def destroy
        @review.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_review
          @review = Review.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def review_params
          params.permit(:review_header,:review_content,:product_id,:user_id,:rating,review_images: [])
        end
      end
  end 
end
