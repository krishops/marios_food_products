class ReviewsController < ApplicationController

  before_action :require_login

    def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      
      redirect_to product_path(@product)
      flash[:notice] = "Review Added"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in to access this page"
        redirect_to '/signin'
      end
    end
end