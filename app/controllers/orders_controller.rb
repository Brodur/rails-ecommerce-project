class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.order(created_at: :desc).page(params[:page])
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def new
    # Make sure we aren't getting passed a bad value
    if params[:address_id].blank?
      redirect_to(new_address_path)
      return
    end

    if Address.find(params[:address_id]).customer_id == current_customer.id
      address = Address.find(params[:address_id])
    elsif current_customer.primary_address.present?
      address = current_customer.primary_address
    end
    # If it's still bad, make another address.

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

  def create
    # Make sure we aren't getting passed a bad value
    if Address.find(params[:order][:address_id]).customer_id == current_customer.id
      address = Address.find(params[:order][:address_id])
    else
      render :new
    end

    # Build the order with the address
    @order = address.orders.build

    # Build the products_orders
    @cart.each do |product, quantity|
      @order.products_orders.build(
        product:        product,
        quantity:       quantity,
        historic_price: product.price,
        historic_cost:  product.cost
      )
    end

    # Fill in the historic tax rates
    @order.customer = current_customer
    if address.province.gst_rate.present? && address.province.gst_rate > 0
      @order.historic_gst_rate = address.province.gst_rate
    end
    if address.province.pst_rate.present? && address.province.pst_rate > 0
      @order.historic_pst_rate = address.province.pst_rate
    end
    if address.province.hst_rate.present? && address.province.hst_rate > 0
      @order.historic_hst_rate = address.province.hst_rate
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
        # Empty the cart
        session[:cart] = {}
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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

  def order_params
    params.require(:odrer).permit({})
  end
end
