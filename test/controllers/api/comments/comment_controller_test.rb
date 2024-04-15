require "test_helper"

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "create valid comment" do
    post '/api/comments', params: { body: "This is a comment", feature_id: 1 }
    assert_response :created
  end

  test "Error when comment with empty body" do
    post '/api/comments', params: { body: "", feature_id: 1  }
    assert_response :unprocessable_entity
  end
end
