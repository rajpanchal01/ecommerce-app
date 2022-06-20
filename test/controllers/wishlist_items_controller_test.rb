require "test_helper"

class WishlistItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist_item = wishlist_items(:one)
  end

  test "should get index" do
    get wishlist_items_url, as: :json
    assert_response :success
  end

  test "should create wishlist_item" do
    assert_difference("WishlistItem.count") do
      post wishlist_items_url, params: { wishlist_item: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show wishlist_item" do
    get wishlist_item_url(@wishlist_item), as: :json
    assert_response :success
  end

  test "should update wishlist_item" do
    patch wishlist_item_url(@wishlist_item), params: { wishlist_item: {  } }, as: :json
    assert_response :success
  end

  test "should destroy wishlist_item" do
    assert_difference("WishlistItem.count", -1) do
      delete wishlist_item_url(@wishlist_item), as: :json
    end

    assert_response :no_content
  end
end
