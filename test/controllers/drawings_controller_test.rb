require 'test_helper'

class DrawingsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  setup do
    @user = users(:ahmed)
    @drawing = drawings(:drawing_with_attachment)
  end

  test "should get index" do
    get :index, params: {page: 1}
    assert_response :success
  end
  
  test "should get new when logged in" do
    sign_in @user
    get :new
    assert_response :success
  end
  
  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to controller: "devise/sessions", action: "new"
  end

  test "should create drawing when logged in" do
    sign_in @user
    assert_difference('Drawing.count') do
      post :create, params: { drawing: {  } }
    end
    assert_redirected_to drawing_url(Drawing.last)
  end

  #test "should show drawing" do
    #get drawing_url(@drawing)
    #assert_response :success
  #end

  #test "should get edit" do
    #get edit_drawing_url(@drawing)
    #assert_response :success
  #end

  #test "should update drawing" do
    #patch drawing_url(@drawing), params: { drawing: {  } }
    #assert_redirected_to drawing_url(@drawing)
  #end

  #test "should destroy drawing" do
    #assert_difference('Drawing.count', -1) do
      #delete drawing_url(@drawing)
    #end

    #assert_redirected_to drawings_url
  #end
end
