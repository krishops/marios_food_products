class LandingController < ApplicationController
  def index
    @products = Product.all
    @reviews = Review.all
    render :index
  end

  def new
    @products = Product.all
    @reviews = Review.all
    redirect_to '/products'
  end
end