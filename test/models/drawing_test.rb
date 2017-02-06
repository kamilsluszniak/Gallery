require 'test_helper'


class DrawingTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:ahmed)
    @drawing = drawings(:drawing_with_attachment)
  end
  
  test "validates attachment param" do
    drawing = Drawing.new(:title => "title")
    assert_not drawing.valid?
  end
  
  test "has an attachment" do
    assert File.exists?(@drawing.attachment.file.path)
  end

  test "uploads an attachment" do
    drawing = Drawing.create!(:user => @user, :title => "title", :attachment => fixture_file_upload('/files/squirrel.jpg', 'image/jpg'))
    assert(File.exists?(drawing.reload.attachment.file.path))
  end
  
  test "validates title" do
    assert @drawing.valid?
    @drawing.title = "a" * 81
    assert_not @drawing.valid?
    @drawing.title = ""
    assert_not @drawing.valid?
  end
end
