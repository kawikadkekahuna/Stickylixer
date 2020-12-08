defmodule StickyTest.BillingModelsTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "billing_model_view/1 with offer_id" do
    assert {:ok, _} = Sticky.BillingModels.billing_model_view(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/billing_model_view")
  end

  test "billing_model_view/1 with billing_model_id" do
    assert {:ok, _} = Sticky.BillingModels.billing_model_view(%{billing_model_id: 2})
    assert_sticky_requested(:post, "/v1/billing_model_view")
  end
end
