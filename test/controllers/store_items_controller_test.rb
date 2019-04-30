require 'test_helper'

class StoreItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_items_index_url
    assert_response :success
  end

end
