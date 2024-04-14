require "test_helper"

class HttpClientTest < ActiveSupport::TestCase
  test "make GET correctly" do
    data = HttpClient.get('https://jsonplaceholder.typicode.com/posts')
    assert data.is_a?(Array), "Data is not an array"
    assert data.length == 100, "Data doesn't have 100 items"
    assert data.first['userId'] == 1, "First item doesn't have userId 1"
  end
end
