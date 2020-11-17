class ProductsController < ApplicationController
  def index
    @products = Product.all.limit(6).includes(:category)
    # render inertia: "Product/Index",
    #        props:   {
    #          products: products.as_json(
    #            only: %i[id upc name price cost description on_hand category]
    #          )
    #        }
  end

  def show
    @product = Product.find(params[:id])
    # render inertia: "Product/Show",
    #        props:   {
    #          product: product.as_json(
    #            only: %i[id upc name price cost description on_hand category]
    #          )
    #        }
  end


end
