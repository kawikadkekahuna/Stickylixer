defmodule Sticky.API do
  use Retry.Annotation
  require Logger
  alias Sticky.Request
  @pool_name __MODULE__

  def request(%Request{} = request) do
    case validate(request) do
      {:error, _message} = error ->
        error

      %Request{client: client, method: method, endpoint: endpoint, params: params} ->
        send(client, method, endpoint, params)
    end

  end

  def supervisor_children() do
    [
      :hackney_pool.child_spec(@pool_name,
        timeout: 5_000,
        max_connections: 10
      )
    ]
  end

  defp validate(%Request{validator: nil} = request), do: request

  defp validate(%Request{validator: validator, params: params} = request) do
    case validator.validate(params) do
      :ok ->
        request
      error ->
        raise "Validation Errors:  #{inspect(error)}"
    end
  end

  defp send(client, method, url, params) do
    case do_apply(client, method, url, params) do
      {:ok, %{body: %{"response_code" => "100"} = body}} ->
        {:ok, body}

      {:ok, %{body: %{"response_code" => code}}} ->
        {:error, Sticky.CodeDefinitions.find_response_reason(code)}

      {:ok, %{status: status, body: body}} when status == 200 ->
        {:ok, body}

      {:ok, %{status: status, body: body}} when status >= 400 ->
        {:error, body}

      {:error, message} ->
        Logger.error(
          "[Sticky] Call Failed after #{Sticky.Config.retry_attempts()} retries. #{
            inspect(message)
          }"
        )

        {:error, message}

      error ->
        Logger.error("[Sticky] Call Failed #{inspect(error)}")
        error
    end
  end

  @retry with: constant_backoff(100) |> Stream.take(Sticky.Config.retry_attempts())
  def do_apply(client, method, url, params) do
    apply(Tesla, method, [client, url, params])
  end
end
