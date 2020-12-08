defmodule Sticky.Products do
  import Sticky.Request

  def customer_find_active_product(params) do
    new()
    |> put_endpoint("/customer_find_active_product")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_attribute_index(params) do
    new()
    |> put_endpoint("/product_attribute_index")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_bundle_index(params) do
    new()
    |> put_endpoint("/product_bundle_index")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_bundle_view(params) do
    new()
    |> put_endpoint("/product_bundle_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_copy(params) do
    new()
    |> put_endpoint("/product_copy")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_create(params) do
    new()
    |> put_endpoint("/product_create")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_delete(params) do
    new()
    |> put_endpoint("/product_delete")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_index(params) do
    new()
    |> put_endpoint("/product_index")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
  def product_update(params) do
    new()
    |> put_endpoint("/product_update")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
