require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcomes_index_url
    assert_response :success 
  end

  test "should show body" do
    get welcomes_index_url
    assert_select "div", 1
    assert_select "p", 18
  end
end
