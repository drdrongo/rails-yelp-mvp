class RestaurantsController < ApplicationController
  def show
    @review = Review.new
    @reviews = Review.where(restaurant_id: params[:id])
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require('restaurant').permit(:name, :address, :phone_number, :category)
  end

  # def get_reviews(restaurant)
  #   @reviews = Review.where(:restaurant_id == params[:id])
  # end
end
