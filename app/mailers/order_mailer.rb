class OrderMailer < ApplicationMailer
  default from: 'Customer Service <customer@depot.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    @greeting = "Hi"

    mail to: order.email,
          subject: "Depot Store - Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    @greeting = "Hi"

    mail to: order.email,
          subject: "Depot Store - Order Shipped"
  end
end
