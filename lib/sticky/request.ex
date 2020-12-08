defmodule Sticky.Request do
  alias Sticky.{API, Request}

  defstruct opts: [],
            endpoint: nil,
            method: nil,
            params: nil,
            version: "v1",
            client: nil,
            validator: nil

  def new(opts \\ []) do
    %Request{opts: opts, client: build_client()}
  end

  def put_endpoint(%Request{} = request, endpoint) do
    %{request | endpoint: endpoint}
  end

  def put_method(%Request{} = request, method) do
    %{request | method: method}
  end

  def put_params(%Request{} = request, params) do
    %{request | params: params}
  end

  def validate_with(%Request{} = request, validator) do
    %{request | validator: validator}
  end

  def make_request(%Request{} = req) do
    API.request(req)
  end

  defp build_client() do
    client(
      Application.get_env(:sticky, :api_key),
      Application.get_env(:sticky, :api_url)
    )
  end

  defp client(api_key, api_url) do
    adapter =
      case Sticky.Config.send_to_http() do
        true ->
          {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}

        false ->
          Tesla.Mock
      end

    client(api_key, api_url, adapter)
  end

  defp client({api_key, api_secret}, api_url, adapter) do
    middleware = [
      {Tesla.Middleware.BaseUrl, api_url},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BasicAuth, %{username: api_key, password: api_secret}}
    ]

    Tesla.client(middleware, adapter)
  end
end
