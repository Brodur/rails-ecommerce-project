class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.order(order_date: :desc).page(params[:page])
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    @order = Order.new

    @cart.each do |product, quantity|
      @order.products_orders.build(
        product:        product,
        quantity:       quantity,
        historic_price: product.price,
        historic_cost:  product.cost
      )
    end
    @addresses = current_customer.addresses
  end

  def create; end

  def order_params
    params.require(:odrer).permit
  end
end
