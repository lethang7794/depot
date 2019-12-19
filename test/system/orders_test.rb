require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order with Cash" do
    visit store_index_url
    click_on "Add to Cart", match: :first
    click_on "Check out"

    fill_in "order_address", with: @order.address
    fill_in "order_email", with: @order.email
    fill_in "order_name", with: @order.name

    assert_selector "select#order_pay_type", text: "Select a payment method"
    select 'Cash', from: "order_pay_type"
    assert_selector "select#order_pay_type", text: "Cash"

    click_on "Create Order"
    assert_text "Order was successfully created - Thank you for your order, we will ship it ASAP."
  end

  test "creating a Order with Credit Card" do
    LineItem.delete_all
    Order.delete_all

    visit store_index_url
    click_on "Add to Cart", match: :first
    click_on "Check out"

    fill_in "order_address", with: @order.address
    fill_in "order_email", with: @order.email
    fill_in "order_name", with: @order.name

    assert_selector "select#order_pay_type", text: "Select a payment method"
    select 'Credit Card', from: "order_pay_type"
    assert_selector "select#order_pay_type", text: "Credit Card"

    fill_in "order_card_number", with: "1111222233334444"
    fill_in "order_cardholder_name", with: "Le Quang Thang"
    fill_in "order_cvv", with: "123"
    fill_in "order_expiration_date", with: "12/20"

    perform_enqueued_jobs do
      click_on "Create Order"
    end

    assert_text "Order was successfully created - Thank you for your order, we will ship it ASAP."

    orders = Order.all
    order = orders.first

    assert_equal 1, orders.size
    assert_equal 1, order.line_items.size

    assert_equal "John",            order.name
    assert_equal "john@gmail.com",  order.email
    assert_equal "John's address",  order.address
    assert_equal "Credit Card",     order.pay_type

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["john@gmail.com"], mail.to
    assert_equal ["customer@depot.com"], mail.from
    assert_equal "Depot Store - Order Confirmation", mail.subject
  end

  test "check payment input fields by React" do
    visit store_index_url
    click_on "Add to Cart", match: :first
    click_on "Check out"

    assert_no_selector "input#order_cardholder_name"
    assert_no_selector "input#order_card_number"
    assert_no_selector "#order_expiration_date"
    assert_no_selector "#order_cvv"
    select 'Credit Card', from: "order_pay_type"
    assert_selector "#order_cardholder_name"
    assert_selector "#order_card_number"
    assert_selector "input#order_expiration_date"
    assert_selector "input#order_cvv"

    assert_no_selector "#order_routing_number"
    assert_no_selector "#order_accouting_number"
    select 'Check', from: "order_pay_type"
    assert_selector "#order_routing_number"
    assert_selector "#order_accouting_number"
  end

  test "updating a Order" do
    # TODO: pay_type
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
