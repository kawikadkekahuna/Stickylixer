import Config

config :logger, :console,
  level: :debug,
  format: "$date $time [$level] $metadata$message\n"

config :stickylixer, :api_key, {"", ""}
config :stickylixer, :api_url, ""
