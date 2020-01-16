require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @name = "User #{rand(1000)}"
  end

  test "visiting the index" do
    login_as_user users(:one)
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    login_as_user users(:one)
    visit users_url
    click_on "New User"

    fill_in "user_name", with: @name
    fill_in "user_password", with: 'secret'
    fill_in "user_password_confirmation", with: 'secret'
    click_on "Create User"

    assert_text "User '#{@name}' was successfully created"
  end

  test "updating a User" do
    login_as_user users(:one)
    visit users_url
    click_on "Edit", match: :first

    fill_in "user_old_password", with: 'secret'
    fill_in "user_password", with: 'new-secret'
    fill_in "user_password_confirmation", with: 'new-secret'
    click_on "Update User"

    assert_text "User '#{@user.name}' was successfully updated"
  end

  test "destroying a User" do
    login_as_user users(:two)
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_text "User was successfully destroyed"
  end
end
