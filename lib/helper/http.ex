defmodule ExPnut.Helper.HTTP do
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def get(client, url, params = %PostParams{}) do
    headers = default_headers(client)

    test = params
          |> Map.from_struct
          |> Map.to_list

    HTTPoison.get!("#{client.endpoint}#{url}", headers, [params: test])
    |> IO.inspect
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  def post(client, url, payload) do
    headers = default_headers(client)

    HTTPoison.post!("#{client.endpoint}#{url}", payload, headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  def put(client, url, payload) do
    headers = default_headers(client)

    HTTPoison.put!("#{client.endpoint}#{url}", payload, headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end

  def delete(client, url) do
    headers = default_headers(client)

    HTTPoison.delete!("#{client.endpoint}#{url}", headers)
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
