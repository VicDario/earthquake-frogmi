require "test_helper"

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "create valid comment" do
    post '/api/comments', params: { comment: { body: "This is a comment", earthquake_id: 1 } }
    assert_response :created
  end

  test "Error when comment with empty body" do
    post '/api/comments', params: { comment: { body: "", earthquake_id: 1 } }
    assert_response :unprocessable_entity
  end
end
