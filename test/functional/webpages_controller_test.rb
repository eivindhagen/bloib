require 'test_helper'

class WebpagesControllerTest < ActionController::TestCase
  setup do
    @webpage = webpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webpage" do
    assert_difference('Webpage.count') do
      post :create, :webpage => @webpage.attributes
    end

    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should show webpage" do
    get :show, :id => @webpage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @webpage.to_param
    assert_response :success
  end

  test "should update webpage" do
    put :update, :id => @webpage.to_param, :webpage => @webpage.attributes
    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should destroy webpage" do
    assert_difference('Webpage.count', -1) do
      delete :destroy, :id => @webpage.to_param
    end

    assert_redirected_to webpages_path
  end
end
