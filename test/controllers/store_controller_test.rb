require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    assert_select 'nav.side_bar ul li a', 3
    assert_select '.store ul.catalog li', 3
    assert_select 'ul.catalog li h2', 'Programming Ruby 1.9'
  end

end
