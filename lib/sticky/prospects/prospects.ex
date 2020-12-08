defmodule Sticky.Prospects do
  import Sticky.Request

  def new_prospect(params) do
    new()
    |> put_endpoint("/new_prospect")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def prospect_find(params) do
    new()
    |> put_endpoint("/prospect_find")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def prospect_update(params) do
    new()
    |> put_endpoint("/prospect_update")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def prospect_view(params) do
    new()
    |> put_endpoint("/prospect_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
