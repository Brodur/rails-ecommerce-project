class ProductsController < ApplicationController
  before_action :initialize_session

  def index
    @products = Product.all.limit(6).includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    session[:cart] << params[:id]
  end

  private

  def initialize_session
    session[:cart] ||= []
  end
end
