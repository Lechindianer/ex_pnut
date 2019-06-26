defmodule ExPnut.Posts.Posts do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.NewPost
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def posts(client, new_post = %NewPost{}, post_params = %PostParams{} \\ %PostParams{}) do
    post_jsonified = new_post
                    |> Jason.encode
                    |> elem(1)
    post(client, "/posts", post_jsonified, post_params)
  end
end
