class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: [:index]
  before_action :set_cart

  def index
    session[:counter] ||= 0
    session[:counter] += 1

    @time = Time.now

    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      # @products = Product.order(price: :desc)
    end
  end
end
