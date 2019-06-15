defmodule ExPnut.Posts.Posts do
  @moduledoc false

  import ExPnut.Helper.HTTP

  def posts(access_token, new_post = %ExPnut.Posts.NewPost{}) do
    post_jsonified = new_post
                    |> Jason.encode
                    |> elem(1)
    post(access_token, "/posts", post_jsonified)
  end
end