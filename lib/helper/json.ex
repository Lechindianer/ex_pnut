defmodule ExPnut.Helper.JSON do
  @moduledoc false

  def jsonify(payload) do
    payload
    |> Jason.encode()
    |> elem(1)
  end
end
