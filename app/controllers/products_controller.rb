class ProductsController < ApplicationController
  def index
    products = Product.all.limit(6).includes(:category)
    render inertia: "App",
           props:   {
             products: products
           }
  end

  def show
    product = Product.find(params[:id])
    render inertia: "App",
           props:   {
             products: [product]
           }
  end
end
