defmodule Sticky.OrdersTest do
  require Logger
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "authorize_payment/1" do
    assert {:ok, _} = Sticky.Orders.authorize_payment(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/authorize_payment")
  end

  test "coupon_validate/1" do
    assert {:ok, _} = Sticky.Orders.coupon_validate(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/coupon_validate")
  end

  test "new_order/1" do
    assert {:ok, _} = Sticky.Orders.new_order(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/new_order")
  end

  test "new_order_card_on_file/1" do
    assert {:ok, _} = Sticky.Orders.new_order_card_on_file(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/new_order_card_on_file")
  end

  test "new_upsell/1" do
    assert {:ok, _} = Sticky.Orders.new_upsell(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/new_upsell")
  end

  test "new_order_with_prospect/1" do
    assert {:ok, _} = Sticky.Orders.new_order_with_prospect(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/new_order_with_prospect")
  end

  test "order_calculate_refund/1" do
    assert {:ok, _} = Sticky.Orders.order_calculate_refund(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_calculate_refund")
  end

  test "order_force_bill/1" do
    assert {:ok, _} = Sticky.Orders.order_force_bill(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_force_bill")
  end

  test "order_find/1" do
    assert {:ok, _} = Sticky.Orders.order_find(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_find")
  end

  test "order_find_overdue/1" do
    assert {:ok, _} = Sticky.Orders.order_find_overdue(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_find_overdue")
  end

  test "order_find_updated/1" do
    assert {:ok, _} = Sticky.Orders.order_find_updated(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_find_updated")
  end

  test "order_view/1" do
    assert {:ok, _} = Sticky.Orders.order_view(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_view")
  end

  test "order_update/1" do
    assert {:ok, _} = Sticky.Orders.order_update(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_update")
  end

  test "order_product_refund/1" do
    assert {:ok, _} = Sticky.Orders.order_product_refund(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_product_refund")
  end

  test "order_product_return/1" do
    assert {:ok, _} = Sticky.Orders.order_product_return(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_product_return")
  end

  test "order_refund/1" do
    assert {:ok, _} = Sticky.Orders.order_refund(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_refund")
  end

  test "order_reprocess/1" do
    assert {:ok, _} = Sticky.Orders.order_reprocess(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_reprocess")
  end

  test "order_void/1" do
    assert {:ok, _} = Sticky.Orders.order_void(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/order_void")
  end

  test "repost_to_fulfillment/1" do
    assert {:ok, _} = Sticky.Orders.repost_to_fulfillment(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/repost_to_fulfillment")
  end

  test "skip_next_billing/1" do
    assert {:ok, _} = Sticky.Orders.skip_next_billing(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/skip_next_billing")
  end

  test "subscription_order_update/1" do
    assert {:ok, _} = Sticky.Orders.subscription_order_update(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/subscription_order_update")
  end

  test "three_d_redirect/1" do
    assert {:ok, _} = Sticky.Orders.three_d_redirect(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/three_d_redirect")
  end

  test "order_view/1 accepts an integer" do
    assert {:ok, _} = Sticky.Orders.order_view(42)
    assert_sticky_requested(:post, "/v1/order_view")
  end

  test "order_view/1 accepts a stringed-number " do
    assert {:ok, _} = Sticky.Orders.order_view("42")
    assert_sticky_requested(:post, "/v1/order_view")
  end

  test "order_view/1 raises when given a non-number" do
    assert_raise(RuntimeError, ~r/id must be a number/, fn ->
      Sticky.Orders.order_view("foo")
      assert_sticky_requested(:post, "/v1/order_view")
    end)
  end
end
