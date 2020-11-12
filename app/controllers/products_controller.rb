class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count

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

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
