defmodule ExPnut.Streams do
  @moduledoc false

  def me(access_token) do
    get_data(access_token, "/posts/streams/me")
  end

  def unified(access_token) do
    get_data(access_token, "/posts/streams/unified")
  end

  def mentions(access_token, user_id) do
    get_data(access_token, "/users/#{user_id}/mentions")
  end

  def posts(access_token, user_id) do
    get_data(access_token, "/users/#{user_id}/posts")
  end

  def global(access_token) do
    get_data(access_token, "#/posts/streams/global")
  end

  def tag(access_token, tag) do
    get_data(access_token, "/posts/tag/#{tag}")
  end

  defp get_data(access_token, url) do
    headers = [
      {"X-Pretty-Json", "1"},
      {"Authorization", "Bearer #{access_token}"},
    ]

    endpoint = Application.get_env(:ex_pnut, :endpoint)

    HTTPoison.get!("#{endpoint}#{url}", headers)
    |> ExPnut.Decode.decode
    |> Map.get(:data)
  end
end
