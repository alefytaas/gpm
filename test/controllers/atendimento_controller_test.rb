require "test_helper"

class AtendimentoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get atendimento_new_url
    assert_response :success
  end

  test "should get create" do
    get atendimento_create_url
    assert_response :success
  end
end
