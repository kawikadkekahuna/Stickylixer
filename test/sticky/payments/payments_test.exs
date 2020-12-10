defmodule StickyTest.PaymentsTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "customer_find_active_product/1" do
    assert {:ok, _} = Sticky.Payments.authorize_payment(%{})
    assert_sticky_requested(:post, "/v1/authorize_payment")
  end

  test "product_attribute_index/1" do
    assert {:ok, _} = Sticky.Payments.gateway_view(%{})
    assert_sticky_requested(:post, "/v1/gateway_view")
  end

  test "product_bundle_index/1" do
    assert {:ok, _} = Sticky.Payments.get_alternative_provider(%{})
    assert_sticky_requested(:post, "/v1/get_alternative_provider")
  end

  test "product_bundle_view/1" do
    assert {:ok, _} = Sticky.Payments.payment_router_view(%{})
    assert_sticky_requested(:post, "/v1/payment_router_view")
  end

  test "product_copy/1" do
    assert {:ok, _} = Sticky.Payments.three_d_redirect(%{})
    assert_sticky_requested(:post, "/v1/three_d_redirect")
  end
end
