ExUnit.start()
Application.put_env(:stickylixer, :api_key, {"sticky_username", "sticky_password"})
Application.put_env(:stickylixer, :api_url, "http://localhost:5000/api/v1/")
Application.put_env(:stickylixer, :send_to_http, false)
