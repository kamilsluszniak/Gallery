require 'test_helper'

class DrawingsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:ahmed)
    @drawing = drawings(:drawing_with_attachment)
  end

  test "should get index" do
    get drawings_path
    assert_response :success
  end
  
  test "should redirect new when not logged in" do
    get new_drawing_path
    assert_redirected_to controller: "devise/sessions", action: "new"
  end
  
  test "should get new when logged in" do
    log_in(@user, '123greetings')
    get new_drawing_path
    assert_response :success
  end

  test "should redirect create when correct params and not logged in" do
    assert_no_difference('Drawing.count') do
      post drawings_path, params: { drawing: {title: "title",
                                              :attachment => fixture_file_upload('/files/squirrel.jpg', 'image/jpg')} }
    end
    assert_redirected_to controller: "devise/sessions", action: "new"
  end
  
  test "should create and destroy drawing" do
    log_in(@user, '123greetings')
    assert_difference('Drawing.count', 1) do
      post drawings_path, params: { drawing: {id: 3, title: "title",
                                              :attachment => fixture_file_upload('/files/squirrel.jpg', 'image/jpg')} }
    end
    drawing = assigns(:drawing)
    assert_redirected_to drawing
    
    assert_difference('Drawing.count', -1) do
      delete drawing_url(drawing)
    end
    assert_redirected_to drawings_url
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

  test "should get edit when logged in" do
    log_in(@user, '123greetings')
    get edit_drawing_url(@drawing)
    assert_response :success
  end

  test "should update drawing" do
    log_in(@user, '123greetings')
    patch drawing_url(@drawing), params: { drawing: { :title => "new_title" } }
    assert_redirected_to drawing_url(@drawing)
    follow_redirect!
    assert_select "p", text: "new_title", count: 1
  end

end
