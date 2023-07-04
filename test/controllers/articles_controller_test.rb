require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get articles_create_url
    assert_response :success
  end

  test "should get get" do
    get articles_get_url
    assert_response :success
  end

  test "should get update" do
    get articles_update_url
    assert_response :success
  end

  test "should get delete" do
    get articles_delete_url
    assert_response :success
  end
end
