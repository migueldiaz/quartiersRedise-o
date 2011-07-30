require 'test_helper'

class PaginasControllerTest < ActionController::TestCase
  setup do
    @pagina = paginas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paginas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagina" do
    assert_difference('Pagina.count') do
      post :create, :pagina => @pagina.attributes
    end

    assert_redirected_to pagina_path(assigns(:pagina))
  end

  test "should show pagina" do
    get :show, :id => @pagina.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pagina.to_param
    assert_response :success
  end

  test "should update pagina" do
    put :update, :id => @pagina.to_param, :pagina => @pagina.attributes
    assert_redirected_to pagina_path(assigns(:pagina))
  end

  test "should destroy pagina" do
    assert_difference('Pagina.count', -1) do
      delete :destroy, :id => @pagina.to_param
    end

    assert_redirected_to paginas_path
  end
end
