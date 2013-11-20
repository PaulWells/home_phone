require 'test_helper'

class WhosHomeRequestsControllerTest < ActionController::TestCase
  setup do
    @whos_home_request = whos_home_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whos_home_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whos_home_request" do
    assert_difference('WhosHomeRequest.count') do
      post :create, whos_home_request: { num_recipients: @whos_home_request.num_recipients, user_id: @whos_home_request.user_id }
    end

    assert_redirected_to whos_home_request_path(assigns(:whos_home_request))
  end

  test "should show whos_home_request" do
    get :show, id: @whos_home_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whos_home_request
    assert_response :success
  end

  test "should update whos_home_request" do
    patch :update, id: @whos_home_request, whos_home_request: { num_recipients: @whos_home_request.num_recipients, user_id: @whos_home_request.user_id }
    assert_redirected_to whos_home_request_path(assigns(:whos_home_request))
  end

  test "should destroy whos_home_request" do
    assert_difference('WhosHomeRequest.count', -1) do
      delete :destroy, id: @whos_home_request
    end

    assert_redirected_to whos_home_requests_path
  end
end
