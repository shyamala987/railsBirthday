require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_new_url
    assert_response :success
  end
end
