defmodule Sticky.Config do
  @moduledoc false

  def send_to_http() do
    Application.get_env(:stickylixer, :send_to_http, true)
  end

  def retry_attempts() do
    Application.get_env(:stickylixer, :retry_attempts, 3)
  end
end
