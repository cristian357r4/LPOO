require 'test_helper'

class SesionesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sesiones_login_url
    assert_response :success
  end

end
