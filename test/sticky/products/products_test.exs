defmodule StickyTest.ProductsTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "customer_find_active_product/1" do
    assert {:ok, _} = Sticky.Products.customer_find_active_product(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/customer_find_active_product")
  end

  test "product_attribute_index/1" do
    assert {:ok, _} = Sticky.Products.product_attribute_index(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_attribute_index")
  end

  test "product_bundle_index/1" do
    assert {:ok, _} = Sticky.Products.product_bundle_index(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_bundle_index")
  end

  test "product_bundle_view/1" do
    assert {:ok, _} = Sticky.Products.product_bundle_view(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_bundle_view")
  end

  test "product_copy/1" do
    assert {:ok, _} = Sticky.Products.product_copy(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_copy")
  end

  test "product_create/1" do
    assert {:ok, _} = Sticky.Products.product_create(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_create")
  end

  test "product_delete/1" do
    assert {:ok, _} = Sticky.Products.product_delete(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_delete")
  end

  test "product_index/1" do
    assert {:ok, _} = Sticky.Products.product_index(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_index")
  end

  test "product_update/1" do
    assert {:ok, _} = Sticky.Products.product_update(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/product_update")
  end
end
