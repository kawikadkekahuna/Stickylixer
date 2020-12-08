ExUnit.start()
Application.put_env(:sticky, :api_key, {"sticky_username", "sticky_password"})
Application.put_env(:sticky, :api_url, "http://localhost:5000/api/v1/")
Application.put_env(:sticky, :send_to_http, false)
