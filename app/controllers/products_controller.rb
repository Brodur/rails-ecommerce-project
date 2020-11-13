class ProductsController < ApplicationController
  def index
    products = Product.all.limit(6).includes(:category)
    render inertia: "Product/Index",
           props:   {
             products: products.as_json(
               only: %i[id upc name price cost description on_hand category]
             )
           }
  end

  def show
    product = Product.find(params[:id])
    render inertia: "Product/Show",
           props:   {
             product: product.as_json(
               only: %i[id upc name price cost description on_hand category]
             )
           }
  end

  def add_to_cart
    id = params[:id]
    quantity = params[:quantity].to_i

    session[:cart][id] = quantity unless session[:cart].include?(id)

    redirect_to(request.referer || root_url)
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)

    redirect_to(request.referer || root_url)
  end

  def update_cart_quantity
    id = params[:id]
    quantity = params[:quantity].to_i

    session[:cart][id] = quantity if session[:cart].include?(id)

    redirect_to(request.referer || root_url)
  end
end
