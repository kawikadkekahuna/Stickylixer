defmodule Sticky.Orders do
  import Sticky.Request

  def authorize_payment(params) do
    new()
    |> put_endpoint("/authorize_payment")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def coupon_validate(params) do
    new()
    |> put_endpoint("/coupon_validate")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def new_order(params) do
    new()
    |> put_endpoint("/new_order")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def new_order_card_on_file(params) do
    new()
    |> put_endpoint("/new_order_card_on_file")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def new_order_with_prospect(params) do
    new()
    |> put_endpoint("/new_order_with_prospect")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def new_upsell(params) do
    new()
    |> put_endpoint("/new_upsell")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_calculate_refund(params) do
    new()
    |> put_endpoint("/order_calculate_refund")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_find(params) do
    new()
    |> put_endpoint("/order_find")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
    # |> validate_with(Sticky.Orders.OrderFind)
  end

  def order_find_overdue(params) do
    new()
    |> put_endpoint("/order_find_overdue")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_find_updated(params) do
    new()
    |> put_endpoint("/order_find_updated")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_force_bill(params) do
    new()
    |> put_endpoint("/order_force_bill")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_product_refund(params) do
    new()
    |> put_endpoint("/order_product_refund")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_product_return(params) do
    new()
    |> put_endpoint("/order_product_return")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_refund(params) do
    new()
    |> put_endpoint("/order_refund")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_reprocess(params) do
    new()
    |> put_endpoint("/order_reprocess")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_update(params) do
    new()
    |> put_endpoint("/order_update")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end


  def order_view(order_id) when is_bitstring(order_id) do
    try do
      {order_id, _} = Integer.parse(order_id)
      order_view(%{order_id: order_id})
    catch
      _,_ ->
      raise "Order id must be a number"
    end
  end

  def order_view(order_id) when is_integer(order_id), do: order_view(%{order_id: order_id})

  def order_view(params) do
    {order_id, _} = new()
    |> put_endpoint("/order_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def order_void(params) do
    new()
    |> put_endpoint("/order_void")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def repost_to_fulfillment(params) do
    new()
    |> put_endpoint("/repost_to_fulfillment")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def skip_next_billing(params) do
    new()
    |> put_endpoint("/skip_next_billing")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def subscription_order_update(params) do
    new()
    |> put_endpoint("/subscription_order_update")
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
