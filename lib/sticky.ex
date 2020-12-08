defmodule Sticky do
  use Application
  require Logger

  def start(_start_type, _args) do
    import Supervisor.Spec, warn: false

    children = Sticky.API.supervisor_children()

    opts = [strategy: :one_for_one, name: Sticky.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
