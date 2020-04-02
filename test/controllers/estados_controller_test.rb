require 'test_helper'

class EstadosControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get estados_inicio_url
    assert_response :success
  end

end
