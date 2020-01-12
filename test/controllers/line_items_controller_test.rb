require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    login_as users(:one)
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    login_as users(:one)
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    login_as users(:one)
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!

    assert_select 'h2', I18n.t('carts.cart.your_cart')
    assert_select 'td', "Programming Ruby 1.9"
  end

  test "should create line_item via AJAX" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }, xhr: true
    end

    assert_response :success

    assert_match /<tr class=\\"highlight-line-item-class/, @response.body
  end

  test "when create 2 unique product and 1 duplicated products" do
    login_as users(:one)
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:one).id }
    end
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:two).id }
    end
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end
    assert_no_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!

    assert_select 'td', 'MyString1'
    assert_select 'td', 'MyString2'
    assert_select 'td', 'Programming Ruby 1.9'
    assert_select 'td.quantity', '1'
    assert_select 'td.quantity', '2'
  end


  test "should show line_item" do
    login_as users(:one)
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    login_as users(:one)
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to @line_item.cart
  end
end
