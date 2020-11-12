class ProductsController < ApplicationController
  def index
    @products = Product.all.order("RANDOM()").limit(6).includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end
end
