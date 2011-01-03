require 'test_helper'

class CachedPhotosControllerTest < ActionController::TestCase
  setup do
    @cached_photo = cached_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cached_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cached_photo" do
    assert_difference('CachedPhoto.count') do
      post :create, :cached_photo => @cached_photo.attributes
    end

    assert_redirected_to cached_photo_path(assigns(:cached_photo))
  end

  test "should show cached_photo" do
    get :show, :id => @cached_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cached_photo.to_param
    assert_response :success
  end

  test "should update cached_photo" do
    put :update, :id => @cached_photo.to_param, :cached_photo => @cached_photo.attributes
    assert_redirected_to cached_photo_path(assigns(:cached_photo))
  end

  test "should destroy cached_photo" do
    assert_difference('CachedPhoto.count', -1) do
      delete :destroy, :id => @cached_photo.to_param
    end

    assert_redirected_to cached_photos_path
  end
end
