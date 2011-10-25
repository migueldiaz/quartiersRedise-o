require 'test_helper'

class SesionUsuariosControllerTest < ActionController::TestCase
  setup do
    @sesion_usuario = sesion_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sesion_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sesion_usuario" do
    assert_difference('SesionUsuario.count') do
      post :create, :sesion_usuario => @sesion_usuario.attributes
    end

    assert_redirected_to sesion_usuario_path(assigns(:sesion_usuario))
  end

  test "should show sesion_usuario" do
    get :show, :id => @sesion_usuario.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sesion_usuario.to_param
    assert_response :success
  end

  test "should update sesion_usuario" do
    put :update, :id => @sesion_usuario.to_param, :sesion_usuario => @sesion_usuario.attributes
    assert_redirected_to sesion_usuario_path(assigns(:sesion_usuario))
  end

  test "should destroy sesion_usuario" do
    assert_difference('SesionUsuario.count', -1) do
      delete :destroy, :id => @sesion_usuario.to_param
    end

    assert_redirected_to sesion_usuarios_path
  end
end
