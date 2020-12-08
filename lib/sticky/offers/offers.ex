defmodule Sticky.Offers do
  import Sticky.Request

  def offer_view(%{offer_id: _offer_id} = params) do
    new()
    |> put_endpoint("/offer_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def offer_view(%{campaign_id: _campaign_id} = params) do
    new()
    |> put_endpoint("/offer_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
