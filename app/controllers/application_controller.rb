class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart
  after_action :add_csrf_token

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart].map { |id, qty| [Product.find(id.to_i), qty] }.to_h
  end

  def add_csrf_token
    cookies["XSRF-TOKEN"] = form_authenticity_token
  end
end
