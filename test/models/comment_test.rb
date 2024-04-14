require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "create valid record successfully" do
    comment = Comment.new(
      earthquake_id: 1,
      body: "This is a comment"
    )
    assert_instance_of Comment, comment, "Record is not an instance of Comment"
    assert comment.valid?, "Record was not valid. Errors: #{comment.errors.full_messages.join(", ")}"
  end

  test "Body cannot be blank" do
    comment = Comment.new(
      earthquake_id: 1,
      body: ""
    )
    assert_not comment.valid?, "Record was valid"
    assert_includes comment.errors.full_messages, "Body can't be blank", "Errors did not match"
    assert_includes comment.errors.full_messages, "Body is too short (minimum is 1 character)", "Errors did not match"
  end
end
