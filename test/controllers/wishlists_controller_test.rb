require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist = wishlists(:one)
  end

  test "should get index" do
    get wishlists_url, as: :json
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference("Wishlist.count") do
      post wishlists_url, params: { wishlist: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show wishlist" do
    get wishlist_url(@wishlist), as: :json
    assert_response :success
  end

  test "should update wishlist" do
    patch wishlist_url(@wishlist), params: { wishlist: {  } }, as: :json
    assert_response :success
  end

  test "should destroy wishlist" do
    assert_difference("Wishlist.count", -1) do
      delete wishlist_url(@wishlist), as: :json
    end

    assert_response :no_content
  end
end
