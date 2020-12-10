defmodule Sticky.Payments do
  import Sticky.Request

  def authorize_payment(params) do
    new()
    |> put_endpoint("/authorize_payment")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def gateway_view(params) do
    new()
    |> put_endpoint("/gateway_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def get_alternative_provider(params) do
    new()
    |> put_endpoint("/get_alternative_provider")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def payment_router_view(params) do
    new()
    |> put_endpoint("/payment_router_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def three_d_redirect(params) do
    new()
    |> put_endpoint("/three_d_redirect")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
