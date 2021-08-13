class LandingController < ApplicationController
  def index
    @products = Product.all
    @reviews = Review.all
  end
end