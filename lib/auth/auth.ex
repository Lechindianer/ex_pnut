defmodule ExPnut.Auth do
  @moduledoc false

  def get_app_access_token do
    data = [
      client_id: System.get_env("CLIENT_ID"),
      client_secret: System.get_env("CLIENT_SECRET"),
      grant_type: "client_credentials"
    ]
    endpoint = Application.get_env(:ex_pnut, :endpoint)

    HTTPoison.post!("#{endpoint}/oauth/access_token", { :form, data })
    |> ExPnut.Decode.decode_app_access_token
    |> Map.get(:access_token)
  end
end
