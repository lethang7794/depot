require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    login_as users(:one)
    get orders_url
    assert_response :success
  end

  test "should get new" do
    post line_items_url, params: { product_id: products(:ruby).id}
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    end

    assert_redirected_to store_index_path(locale: I18n.locale)
    assert flash[:notice], 'Order was successfully created - Thank you for your order, we will ship it ASAP.'
  end

  test "should show order" do
    login_as users(:one)
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    login_as users(:one)
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    login_as users(:one)
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    login_as users(:one)
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end

  test "should require line items" do
    get new_order_url
    assert_redirected_to store_index_path
    assert flash[:notice], "Your cart is empty!"
  end
end
