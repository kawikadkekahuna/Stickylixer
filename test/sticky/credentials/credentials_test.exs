defmodule StickyTest.Credentials do
  use Sticky.StickyCase, async: true

  setup do
    mock(fn _body ->
      %Tesla.Env{status: 200, body: %{"response_code" => "100"}}
    end)

    :ok
  end

  test "can validate credentials" do
    assert {:ok, _} = Sticky.Credentials.validate_credentials()
    assert_sticky_requested(:post, "/v1/validate_credentials", body: %{})
  end
end
