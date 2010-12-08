require 'test_helper'

class Demo::SiteUrlsControllerTest < ActionController::TestCase
  setup do
    @demo_site_url = demo_site_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demo_site_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demo_site_url" do
    assert_difference('Demo::SiteUrl.count') do
      post :create, :demo_site_url => @demo_site_url.attributes
    end

    assert_redirected_to demo_site_url_path(assigns(:demo_site_url))
  end

  test "should show demo_site_url" do
    get :show, :id => @demo_site_url.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @demo_site_url.to_param
    assert_response :success
  end

  test "should update demo_site_url" do
    put :update, :id => @demo_site_url.to_param, :demo_site_url => @demo_site_url.attributes
    assert_redirected_to demo_site_url_path(assigns(:demo_site_url))
  end

  test "should destroy demo_site_url" do
    assert_difference('Demo::SiteUrl.count', -1) do
      delete :destroy, :id => @demo_site_url.to_param
    end

    assert_redirected_to demo_site_urls_path
  end
end
