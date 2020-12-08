# Sticky.io Client

An Elixir library for working with [Sticky](https://sticky.io/).


## Installation

Install the dependency.

```ex
{:stickylixer, "~> 0.1.1"}
```

## Configuration

To make API calls, it is necessary to configure your Sticky secret key.

```ex
use Mix.Config

config :stickylixer, :api_key, {"sticky-username", "sticky-password"}
config :stickylixer, :api_url, "http://localhost:5000/api/v1"
```

## Examples

You can run `Sticky.Credentials.validate_credentials/0` to ensure you are authenticated.
``` elixir
iex(1)> Sticky.Credentials.validate_credentials
{:ok, %{"response_code" => "100"}}
```

For a list of (most) available methods available, checkout the [Sticky.io v1 docs](https://developer-prod.sticky.io/#60631517-0146-4ec9-a434-5b5cf132a76a).  (NOTE: `Payments` and `Members` endpoints are currently unsupported)
