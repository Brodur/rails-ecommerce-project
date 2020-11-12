class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def index
    @products = Product.all.limit(6).includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id]
    quantity = params[:quantity].to_i

    session[:cart][id] = quantity unless session[:cart].include?(id)

    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)

    redirect_to root_path
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart].map { |id, qty| [Product.find(id.to_i), qty] }.to_h
  end
end
