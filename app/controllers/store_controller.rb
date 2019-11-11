class StoreController < ApplicationController
  def index
    @time = Time.now

    @products = Product.order(:title)
    # @products = Product.order(price: :desc)
  end
end
