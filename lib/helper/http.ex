defmodule ExPnut.Helper.HTTP do
  @moduledoc false

  def get(access_token, url) do
    headers = default_headers(access_token)
    endpoint = Application.get_env(:ex_pnut, :endpoint)

    HTTPoison.get!("#{endpoint}#{url}", headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  def post(access_token, url, payload) do
    headers = default_headers(access_token)
    endpoint = Application.get_env(:ex_pnut, :endpoint)

    HTTPoison.post!("#{endpoint}#{url}", payload, headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  defp default_headers(access_token) do
    [
      {"Authorization", "Bearer #{access_token}"},
      {"Content-Type", "application/json"},
      {"X-Pretty-Json", "1"},
    ]
  end
end
