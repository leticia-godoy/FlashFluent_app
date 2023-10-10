require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest

  test "get home page" do
    get pages_home_url
    assert_response :success
  end

  test "get root page" do
    get root_url
    assert_response :success
  end
end
