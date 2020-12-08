defmodule Sticky.Campaigns do
  import Sticky.Request

  def campaign_find_active(params) do
    new()
    |> put_endpoint("/campaign_find_active")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def campaign_view(params) do
    new()
    |> put_endpoint("/campaign_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
