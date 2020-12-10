defmodule StickyTest.ProspectsTest do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "new_prospect/1" do
    assert {:ok, _} = Sticky.Prospects.new_prospect(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/new_prospect")
  end

  test "prospect_find/1" do
    assert {:ok, _} = Sticky.Prospects.prospect_find(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/prospect_find")
  end

  test "prospect_update/1" do
    assert {:ok, _} = Sticky.Prospects.prospect_update(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/prospect_update")
  end

  test "prospect_view/1" do
    assert {:ok, _} = Sticky.Prospects.prospect_view(%{offer_id: 42})
    assert_sticky_requested(:post, "/v1/prospect_view")
  end

  test "prospect_view/1 accepts an integer" do
    assert {:ok, _} = Sticky.Prospects.prospect_view(42)
    assert_sticky_requested(:post, "/v1/prospect_view")
  end

  test "prospect_view/1 accepts a stringed-number " do
    assert {:ok, _} = Sticky.Prospects.prospect_view("42")
    assert_sticky_requested(:post, "/v1/prospect_view")
  end

  test "prospect_view/1 raises when given a non-number" do
    assert_raise(RuntimeError, ~r/id must be a number/, fn ->
      Sticky.Prospects.prospect_view("foo")
      assert_sticky_requested(:post, "/v1/prospect_view")
    end)
  end
end
