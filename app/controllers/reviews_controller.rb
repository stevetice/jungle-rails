class ReviewsController < ApplicationController

   before_action :set_review, only: :destroy
   before_action :logged_in, only: [:create, :destroy]

  def create

    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      redirect_to @product
    end

  end


  def destroy
    @review.destroy
    redirect_to @product
  end


  private

    def set_chicken
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end

    def logged_in
      if !current_user
        redirect_to :login
    end

  end

end
