require 'test_helper'

class IndicateControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get indicate_new_url
    assert_response :success
  end

  test "should get create" do
    get indicate_create_url
    assert_response :success
  end

end
