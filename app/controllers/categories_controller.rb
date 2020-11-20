class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:products, :children, :parent).page params[:page]
  end

  def show
    @category = Category.find(params[:id])
  end
end
