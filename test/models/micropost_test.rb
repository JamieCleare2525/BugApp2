require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @micropost = Micropost.new(title: "Lorem ipsum",
                  description: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "title should be present" do
    @micropost.title = "     "
    assert_not @micropost.valid?
  end

  test "title should be at most 40 characters" do
    @micropost.title = "a" * 41
    assert_not @micropost.valid?
  end

  test "description should be present" do
    @micropost.description = "   "
    assert_not @micropost.valid?
  end

  test "description should be at most 255 characters" do
    @micropost.description = "a" * 256
    assert_not @micropost.valid?
  end
end
