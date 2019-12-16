require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Depot Store - Order Confirmation", mail.subject
    assert_equal ["john@gmail.com"], mail.to
    assert_equal ["customer@depot.com"], mail.from
    assert_match "Dear John", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Depot Store - Order Shipped", mail.subject
    assert_equal ["john@gmail.com"], mail.to
    assert_equal ["customer@depot.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
