class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product

    if @review.save!
      redirect_to @product, notice: 'Review was successfully created'
    else
      redirect_to @product, notice: 'Failed to create review'
    end
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :description, :rating)
  end
end
