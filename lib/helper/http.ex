defmodule ExPnut.Helper.HTTP do
  import ExPnut.Helper.UrlParams

  @moduledoc """
  Helper including basic HTTP methods
  """

  def get(client, url, params) do
    headers = default_headers(client)
    params = build(params)

    "#{client.endpoint}#{url}"
    |> HTTPoison.get!(headers, params: params)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  def post(client, url, payload, params) do
    headers = default_headers(client)
    params = build(params)

    "#{client.endpoint}#{url}"
    |> HTTPoison.post!(payload, headers, params: params)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  def put(client, url, payload, params) do
    headers = default_headers(client)
    params = build(params)

    "#{client.endpoint}#{url}"
    |> HTTPoison.put!(payload, headers, params: params)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  def delete(client, url) do
    headers = default_headers(client)

    "#{client.endpoint}#{url}"
    |> HTTPoison.delete!(headers)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  defp default_headers(client) do
    [
      {"Authorization", "Bearer #{client.auth}"},
      {"Content-Type", "application/json"},
      {"X-Pretty-Json", "1"}
    ]
  end
end
