defmodule ExPnut.Decode do
  @moduledoc false

  def decode(response) do
    decoded_body = response.body
                   |> Jason.decode!([{ :keys, :atoms }])

    cond do
      decoded_body.meta.code === 200 -> decoded_body
      decoded_body.meta.code === 201 -> decoded_body
    end
  end

  def decode_app_access_token(response) do
    200 = response.status_code

    response.body
    |> Jason.decode!([{ :keys, :atoms }])
  end
end