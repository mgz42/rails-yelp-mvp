class ReviewsController < ApplicationController
  # def new
  #   @restaurant = Restaurant.find(params["restaurant_id"])
  #   @review = Review.new
  # end

  def create
    @restaurant = Restaurant.find(params["restaurant_id"])
    @review = Review.new(params_safe)
    @review.restaurant_id = @restaurant.id

    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render "restaurants/show"
    end
  end

  private

  def params_safe
    params.require(:review).permit(:content, :rating)
  end
end
