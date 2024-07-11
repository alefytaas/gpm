require "test_helper"

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get admins" do
    get infos_admins_url
    assert_response :success
  end
end
