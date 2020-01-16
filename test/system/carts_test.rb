require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  setup do
    @cart = carts(:one)
  end

  test "visiting the index" do
    login_as_user users(:one)
    visit carts_url
    assert_selector "h1", text: "Carts"
  end

  test "creating a Cart" do
    login_as_user users(:one)
    visit carts_url
    click_on "New Cart"
    click_on "Create Cart"
    assert_text "Cart was successfully created"
    click_on "Back"
  end

  test "updating a Cart" do
    login_as_user users(:one)
    visit carts_url
    click_on "Edit", match: :first
    click_on "Update Cart"
    assert_text "Cart was successfully updated"
    click_on "Back"
  end

  test "destroying own Cart" do
    visit store_index_url
    click_on "Add to Cart", match: :first
    page.accept_confirm do
      click_on "Delete this cart - Empty cart"
    end
    page.has_css?('side_cart_first_empty', style: "display: none;")
  end
end
