defmodule StickyTest.CustomersTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "customer_find/1" do
    assert {:ok, _} = Sticky.Customers.customer_find(%{})
    assert_sticky_requested(:post, "/v1/customer_find")
  end

  test "customer_find_active_product/1" do
    assert {:ok, _} = Sticky.Customers.customer_find_active_product(%{billing_model_id: 2})
    assert_sticky_requested(:post, "/v1/customer_find_active_product")
  end

  test "customer_view/1" do
    assert {:ok, _} = Sticky.Customers.customer_view(%{billing_model_id: 2})
    assert_sticky_requested(:post, "/v1/customer_view")
  end
end
