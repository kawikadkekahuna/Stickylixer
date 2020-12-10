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

  def prospect_view(prospect_id) when is_bitstring(prospect_id) do
    try do
      {prospect_id, _} = Integer.parse(prospect_id)
      prospect_view(%{prospect_id: prospect_id})
    catch
      _,_ ->
      raise "Prospect id must be a number"
    end
  end

  def prospect_view(prospect_id) when is_integer(prospect_id), do: prospect_view(%{prospect_id: prospect_id})

  def prospect_view(params) do
    new()
    |> put_endpoint("/prospect_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
