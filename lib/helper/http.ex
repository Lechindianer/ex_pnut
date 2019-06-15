defmodule ExPnut.Helper.HTTP do
  @moduledoc false

  def get(access_token, url) do
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