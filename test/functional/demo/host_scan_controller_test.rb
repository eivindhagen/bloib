require 'test_helper'

class Demo::HostScanControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
