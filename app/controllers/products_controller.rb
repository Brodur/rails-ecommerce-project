class ProductsController < ApplicationController
  def index
    @products = Product.all.order("RANDOM()").limit(6).includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
  end

  def incrememnt_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
