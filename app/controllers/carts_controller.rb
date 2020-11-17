class CartsController < ApplicationController
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
