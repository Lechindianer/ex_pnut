defmodule ExPnut.Helper.HTTP do
  @moduledoc false

  def get(client, url) do
    headers = default_headers(client)

    HTTPoison.get!("#{client.endpoint}#{url}", headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  def post(client, url, payload) do
    headers = default_headers(client)

    HTTPoison.post!("#{client.endpoint}#{url}", payload, headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  defp default_headers(client) do
    [
      {"Authorization", "Bearer #{client.auth}"},
      {"Content-Type", "application/json"},
      {"X-Pretty-Json", "1"},
    ]
  end
end
