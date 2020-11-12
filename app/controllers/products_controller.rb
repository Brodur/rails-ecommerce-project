class ProductsController < ApplicationController
  before_action :initialize_session

  def index
    @products = Product.all.limit(6).includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
  end
end
