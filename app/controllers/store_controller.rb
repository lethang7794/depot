class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    session[:counter] ||= 0
    session[:counter] += 1

    @time = Time.now

    @products = Product.order(:title)
    # @products = Product.order(price: :desc)
  end
end
