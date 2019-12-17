require './lib/pago.rb'

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  enum pay_type: {
    "Credit Card" => 1,
    "Check" => 2,
    "Cash" => 3,
  }

  validates :name, :email, :address, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

  def charge!(pay_type_params)
    payment_method = nil
    payment_details = {}
    case pay_type
    when "Credit Card"
      payment_method = :credit_card
      payment_details[:cardholder_name] = pay_type_params[:cardholder_name]
      payment_details[:card_number] = pay_type_params[:card_number]
      payment_details[:expiration_date] = pay_type_params[:expiration_date]
      payment_details[:cvv] = pay_type_params[:cvv]
    when "Check"
      payment_method = :check
      payment_details[:routing_number] = pay_type_params[:routing_number]
      payment_details[:accouting_number] = pay_type_params[:accouting_number]
    when "Cash"
      payment_method = :cash
    end

    payment_result = Pago.make_payment(
      order_id: id,
      payment_method: payment_method,
      payment_details: payment_details
    )

    if payment_result.succeeded?
      OrderMailer.received(self).deliver_later
    else
      raise "Payment Proceesing Error"
    end
  end
end
