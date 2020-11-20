class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:products, :children, :parent).paginate(page: params[:page])
  end

  def show
    @category = Category.find(params[:id])
  end
end
