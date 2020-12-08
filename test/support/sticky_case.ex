defmodule Sticky.StickyCase do
  @moduledoc """
  Defines helpers for testing.
  """

  use ExUnit.CaseTemplate

  def assert_sticky_requested(expected_method, path, extra \\ []) do
    expected_url = build_url(path, Keyword.get(extra, :query))
    expected_body = Keyword.get(extra, :body)

    assert_received({method, url, headers, body})

    assert expected_method == method
    assert expected_url == url

    assert_sticky_request_body(expected_body, body)
  end

  def sticky_base_url() do
    Application.get_env(:sticky, :api_url)
  end

  @doc """
    We wrap Tesla.Mock to send store the message in the caller's process.  Allows the assert_received in `assert_sticky_requested/2` to pass.
  """
  def mock(fun) do
    Tesla.Mock.mock(fn %{method: method, body: body, url: url, headers: headers} = params ->
      send(self(), {method, url, headers, body})
      fun.(params)
    end)
  end

  defp assert_sticky_request_body(nil, _), do: nil

  defp assert_sticky_request_body(expected_body, body) do
    assert Jason.decode!(body) == expected_body
  end

  defp build_url("/v1/" <> path, nil) do
    sticky_base_url() <> path
  end

  using do
    quote do
      import Sticky.StickyCase,
        only: [
          assert_sticky_requested: 2,
          assert_sticky_requested: 3,
          mock: 1
        ]
    end
  end
end
