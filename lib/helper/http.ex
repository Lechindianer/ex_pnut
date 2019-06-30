defmodule ExPnut.Helper.HTTP do
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def get(client, url, post_params = %PostParams{}) do
    headers = default_headers(client)
    params = build_url_params(post_params)

    "#{client.endpoint}#{url}"
    |> HTTPoison.get!(headers, params: params)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  def post(client, url, payload, post_params = %PostParams{}) do
    headers = default_headers(client)
    params = build_url_params(post_params)

    "#{client.endpoint}#{url}"
    |> HTTPoison.post!(payload, headers, params: params)
    |> ExPnut.Decode.decode()
    |> Map.get(:data)
  end

  def put(client, url, payload, post_params = %PostParams{}) do
    headers = default_headers(client)
    params = build_url_params(post_params)

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

  defp build_url_params(params) do
    params
    |> Map.from_struct()
    |> Map.to_list()
  end

  defp default_headers(client) do
    [
      {"Authorization", "Bearer #{client.auth}"},
      {"Content-Type", "application/json"},
      {"X-Pretty-Json", "1"}
    ]
  end
end
