defmodule ExPnut.Posts.Posts do
  @moduledoc false

  import ExPnut.Helper.HTTP

  def posts(client, new_post = %ExPnut.Posts.NewPost{}) do
    post_jsonified = new_post
                    |> Jason.encode
                    |> elem(1)
    post(client, "/posts", post_jsonified)
  end
end
