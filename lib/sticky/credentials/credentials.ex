defmodule Sticky.Credentials do
  import Sticky.Request
  def validate_credentials() do
    new()
    |> put_endpoint("/validate_credentials")
    |> put_method(:post)
    |> put_params(%{})
    |> make_request()
  end
end
