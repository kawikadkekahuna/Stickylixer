defmodule Sticky.Customers do
  import Sticky.Request

  def customer_find(params) do
    new()
    |> put_endpoint("/customer_find")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def customer_find_active_product(params) do
    new()
    |> put_endpoint("/customer_find_active_product")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def customer_view(params) do
    new()
    |> put_endpoint("/customer_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
