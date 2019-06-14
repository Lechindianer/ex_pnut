defmodule ExPnut.Decode do
  @moduledoc false

  def decode_app_access_token(response) do
    200 = response.status_code

    response.body
    |> Jason.decode!([{ :keys, :atoms }])
  end
end