require 'ostruct'
class Pago
  def self.make_payment(order_id:,
                        payment_method:,
                        payment_details:)
    case payment_method
    when :credit_card
      Rails.logger.info "Processing Credit Card Payment"
    when :check
      Rails.logger.info "Processing Check Payment"
    when :cash
      Rails.logger.info "Processing Cash Payment"
    else
      raise "Unknow Payment Method: #{payment_method}"
    end

    sleep 3
    Rails.logger.info "Payment succeeded"
    OpenStruct.new(succeeded?: true)
  end
end
