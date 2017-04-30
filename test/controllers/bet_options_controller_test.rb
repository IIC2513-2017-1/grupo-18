require 'test_helper'

class BetOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_option = bet_options(:one)
  end

  test "should get index" do
    get bet_options_url
    assert_response :success
  end

  test "should get new" do
    get new_bet_option_url
    assert_response :success
  end

  test "should create bet_option" do
    assert_difference('BetOption.count') do
      post bet_options_url, params: { bet_option: { bet_id: @bet_option.bet_id, description: @bet_option.description, percentage: @bet_option.percentage } }
    end

    assert_redirected_to bet_option_url(BetOption.last)
  end

  test "should show bet_option" do
    get bet_option_url(@bet_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_bet_option_url(@bet_option)
    assert_response :success
  end

  test "should update bet_option" do
    patch bet_option_url(@bet_option), params: { bet_option: { bet_id: @bet_option.bet_id, description: @bet_option.description, percentage: @bet_option.percentage } }
    assert_redirected_to bet_option_url(@bet_option)
  end

  test "should destroy bet_option" do
    assert_difference('BetOption.count', -1) do
      delete bet_option_url(@bet_option)
    end

    assert_redirected_to bet_options_url
  end
end
