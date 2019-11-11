class StoreController < ApplicationController
  def index
    session[:counter] ||= 0
    session[:counter] += 1

    @time = Time.now

    @products = Product.order(:title)
    # @products = Product.order(price: :desc)
  end
end
