require 'test_helper'

class DrawingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:ahmed)
    @drawing = drawings(:drawing_with_attachment)
  end

  test "should get index" do
    get drawings_path, params: {page: 1}
    assert_response :success
  end
  
  test "should redirect new when not logged in" do
    get new_drawing_path
    assert_redirected_to controller: "devise/sessions", action: "new"
  end

  test "should redirect create when correct params and not logged in" do
    assert_no_difference('Drawing.count') do
      post drawings_path, params: { drawing: {title: "title",
                                              :attachment => fixture_file_upload('/files/squirrel.jpg', 'image/jpg'),
                                              user: @user} }
    end
    assert_redirected_to controller: "devise/sessions", action: "new"
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference('Drawing.count') do
      delete drawing_path(@drawing)
    end
    assert_redirected_to controller: "devise/sessions", action: "new"
  end

  test "should redirect edit and update wnen not logged in" do
    patch drawing_url(@drawing)
    assert_redirected_to controller: "devise/sessions", action: "new"
    put drawing_url(@drawing), params: { drawing: {title: "title"}}
    assert_redirected_to controller: "devise/sessions", action: "new"
  end

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
