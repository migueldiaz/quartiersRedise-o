require 'test_helper'

class ForosControllerTest < ActionController::TestCase
  setup do
    @foro = foros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foro" do
    assert_difference('Foro.count') do
      post :create, :foro => @foro.attributes
    end

    assert_redirected_to foro_path(assigns(:foro))
  end

  test "should show foro" do
    get :show, :id => @foro.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @foro.to_param
    assert_response :success
  end

  test "should update foro" do
    put :update, :id => @foro.to_param, :foro => @foro.attributes
    assert_redirected_to foro_path(assigns(:foro))
  end

  test "should destroy foro" do
    assert_difference('Foro.count', -1) do
      delete :destroy, :id => @foro.to_param
    end

    assert_redirected_to foros_path
  end
end
