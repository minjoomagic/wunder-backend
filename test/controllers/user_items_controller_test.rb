require 'test_helper'

class UserItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_items_index_url
    assert_response :success
  end

end
