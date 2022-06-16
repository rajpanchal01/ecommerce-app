require "test_helper"

class UserAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_address = user_addresses(:one)
  end

  test "should get index" do
    get user_addresses_url, as: :json
    assert_response :success
  end

  test "should create user_address" do
    assert_difference("UserAddress.count") do
      post user_addresses_url, params: { user_address: { 2: @user_address.2, address_line: @user_address.address_line, address_line1: @user_address.address_line1, city: @user_address.city, country: @user_address.country, mobile_no: @user_address.mobile_no, postal_code: @user_address.postal_code } }, as: :json
    end

    assert_response :created
  end

  test "should show user_address" do
    get user_address_url(@user_address), as: :json
    assert_response :success
  end

  test "should update user_address" do
    patch user_address_url(@user_address), params: { user_address: { 2: @user_address.2, address_line: @user_address.address_line, address_line1: @user_address.address_line1, city: @user_address.city, country: @user_address.country, mobile_no: @user_address.mobile_no, postal_code: @user_address.postal_code } }, as: :json
    assert_response :success
  end

  test "should destroy user_address" do
    assert_difference("UserAddress.count", -1) do
      delete user_address_url(@user_address), as: :json
    end

    assert_response :no_content
  end
end
