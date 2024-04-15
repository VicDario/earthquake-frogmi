require "test_helper"

class CommentControllerTest < ActionDispatch::IntegrationTest
  def setup
    @feature_id = 1
  end

  test "Get comments by feature id" do
    get '/api/comments', params: { feature_id: @feature_id }
    assert_response :success
  end

  test "Should return bad request if feature_id is missing" do
    get '/api/comments'
    assert_response :bad_request
    assert_equal({ "error" => "Feature ID is required" }, JSON.parse(response.body))
  end

  test "Create valid comment" do
    post '/api/comments', params: { comment: { body: 'This is a comment', feature_id: @feature_id } }
    assert_response :created
  end

  test "Error when comment with empty body" do
    post '/api/comments', params: { comment: { body: '', feature_id: @feature_id } }
    assert_response :unprocessable_entity
  end
end
