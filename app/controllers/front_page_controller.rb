class FrontPageController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
    @categories = Category.roots
  end
end
