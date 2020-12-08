defmodule StickyTest.CampaignsTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "campaign_find_active/1 with offer_id" do
    assert {:ok, _} = Sticky.Campaigns.campaign_find_active(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/campaign_find_active")
  end

  test "campaign_view/1 with billing_model_id" do
    assert {:ok, _} = Sticky.Campaigns.campaign_view(%{billing_model_id: 2})
    assert_sticky_requested(:post, "/v1/campaign_view")
  end
end
