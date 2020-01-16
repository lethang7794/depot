class OrdersController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: [:new, :create]
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_is_not_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to store_index_path, notice: 'Order was successfully created - Thank you for your order, we will ship it ASAP.' }
        format.json { render :show, status: :created, location: @order }

        # OrderMailer.received(@order).deliver_later
        # @order.charge!(pay_type_params)
        ChargeOrderJob.perform_later(@order, pay_type_params.to_h)
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_type)
    end

    def ensure_cart_is_not_empty
      if @cart.line_items.empty?
        redirect_to store_index_path, notice: "Your cart is empty!"
      end
    end

  private
    def pay_type_params
      if order_params[:pay_type] == 'Credit Card'
        params.require(:order).permit(:cardholder_name, :credit_card_number, :expiration_date, :cvv)
      elsif order_params[:pay_type] == 'Check'
        params.require(:order).permit(:routing_number, :accouting_number)
      elsif order_params[:pay_type] == 'Cash'
        {}
      else
        {}
      end
    end

end
