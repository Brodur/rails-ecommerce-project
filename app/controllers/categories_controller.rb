class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page]).includes(:products, :children, :parent)
  end

  def show
    @category = Category.find(params[:id])
  end
end
