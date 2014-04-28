require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get zindex" do
    get :zindex
    assert_response :success
  end

end
