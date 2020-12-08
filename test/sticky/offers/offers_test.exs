defmodule StickyTest.OffersTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "offer_view/1 by campaign_id" do
    assert {:ok, _} = Sticky.Offers.offer_view(%{campaign_id: 1})
    assert_sticky_requested(:post, "/v1/offer_view")
  end

  test "offer_view/1 by offer_id" do
    assert {:ok, _} = Sticky.Offers.offer_view(%{offer_id: 1})
    assert_sticky_requested(:post, "/v1/offer_view")
  end
end
