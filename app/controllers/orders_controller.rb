class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.order(order_date: :desc).page(params[:page])
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    # Make sure we aren't getting passed a bad value
    if Address.find(params[:address_id]).customer_id == current_customer.id
      address = Address.find(params[:address_id])
    else
      address = current_customer.primary_address if current_customer.primary_address.present?
      # If it's still bad, make another address.
      redirect_to(new_address_path) if address.nil?
    end

    @order = address.orders.build

    @cart.each do |product, quantity|
      @order.products_orders.build(
        product:        product,
        quantity:       quantity,
        historic_price: product.price,
        historic_cost:  product.cost
      )
    end
  end

  def select_address; end

  def view_cart
    @order = Order.new

    @cart.each do |product, quantity|
      @order.products_orders.build(
        product:        product,
        quantity:       quantity,
        historic_price: product.price,
        historic_cost:  product.cost
      )
    end
  end

  def create; end

  def order_params
    params.require(:odrer).permit
  end
end
