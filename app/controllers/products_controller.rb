class ProductsController < ApplicationController
  def index
    @products = Product.all.order("RANDOM()").limit(6).includes(:category)
    session[:visit_count] ||= 0
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def show
    @product = Product.find(params[:id])
  end
end
