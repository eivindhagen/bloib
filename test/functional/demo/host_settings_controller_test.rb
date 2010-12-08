require 'test_helper'

class Demo::HostSettingsControllerTest < ActionController::TestCase
  setup do
    @demo_host_setting = demo_host_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demo_host_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demo_host_setting" do
    assert_difference('Demo::HostSetting.count') do
      post :create, :demo_host_setting => @demo_host_setting.attributes
    end

    assert_redirected_to demo_host_setting_path(assigns(:demo_host_setting))
  end

  test "should show demo_host_setting" do
    get :show, :id => @demo_host_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @demo_host_setting.to_param
    assert_response :success
  end

  test "should update demo_host_setting" do
    put :update, :id => @demo_host_setting.to_param, :demo_host_setting => @demo_host_setting.attributes
    assert_redirected_to demo_host_setting_path(assigns(:demo_host_setting))
  end

  test "should destroy demo_host_setting" do
    assert_difference('Demo::HostSetting.count', -1) do
      delete :destroy, :id => @demo_host_setting.to_param
    end

    assert_redirected_to demo_host_settings_path
  end
end
