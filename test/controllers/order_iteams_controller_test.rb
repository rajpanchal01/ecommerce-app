require "test_helper"

class OrderIteamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_iteam = order_iteams(:one)
  end

  test "should get index" do
    get order_iteams_url, as: :json
    assert_response :success
  end

  test "should create order_iteam" do
    assert_difference("OrderIteam.count") do
      post order_iteams_url, params: { order_iteam: { quantity: @order_iteam.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show order_iteam" do
    get order_iteam_url(@order_iteam), as: :json
    assert_response :success
  end

  test "should update order_iteam" do
    patch order_iteam_url(@order_iteam), params: { order_iteam: { quantity: @order_iteam.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy order_iteam" do
    assert_difference("OrderIteam.count", -1) do
      delete order_iteam_url(@order_iteam), as: :json
    end

    assert_response :no_content
  end
end
