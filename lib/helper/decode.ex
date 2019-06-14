defmodule ExPnut.Decode do
  @moduledoc false

  def decode(response) do
    decoded_body = response.body
                   |> Jason.decode!([{ :keys, :atoms }])

    200 = decoded_body.meta.code

    decoded_body
  end

  def decode_app_access_token(response) do
    200 = response.status_code

    response.body
    |> Jason.decode!([{ :keys, :atoms }])
  end
end