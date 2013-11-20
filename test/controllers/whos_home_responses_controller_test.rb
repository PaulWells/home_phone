require 'test_helper'

class WhosHomeResponsesControllerTest < ActionController::TestCase
  setup do
    @whos_home_response = whos_home_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whos_home_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whos_home_response" do
    assert_difference('WhosHomeResponse.count') do
      post :create, whos_home_response: { is_home: @whos_home_response.is_home, user_id: @whos_home_response.user_id, whos_home_request_id: @whos_home_response.whos_home_request_id }
    end

    assert_redirected_to whos_home_response_path(assigns(:whos_home_response))
  end

  test "should show whos_home_response" do
    get :show, id: @whos_home_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whos_home_response
    assert_response :success
  end

  test "should update whos_home_response" do
    patch :update, id: @whos_home_response, whos_home_response: { is_home: @whos_home_response.is_home, user_id: @whos_home_response.user_id, whos_home_request_id: @whos_home_response.whos_home_request_id }
    assert_redirected_to whos_home_response_path(assigns(:whos_home_response))
  end

  test "should destroy whos_home_response" do
    assert_difference('WhosHomeResponse.count', -1) do
      delete :destroy, id: @whos_home_response
    end

    assert_redirected_to whos_home_responses_path
  end
end
