class ReviewsController < ApplicationController
  before_filter :require_login

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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.product , notice: 'Destruction has come upon your comment'
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :description, :rating)
  end

    def require_login
    unless current_user
    redirect_to '/', notice: "You must be logged in to access this section"
    end
  end

end
