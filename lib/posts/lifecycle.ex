defmodule ExPnut.Posts.Lifecycle do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.NewPost
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def posts(client, new_post = %NewPost{}, post_params = %PostParams{} \\ %PostParams{}) do
    post_jsonified =
      new_post
      |> Jason.encode()
      |> elem(1)

    post(client, "/posts", post_jsonified, post_params)
  end

  def revise_post(
        client,
        postId,
        new_post = %NewPost{},
        post_params = %PostParams{} \\ %PostParams{}
      ) do
    post_jsonified =
      new_post
      |> Jason.encode()
      |> elem(1)

    put(client, "/posts/#{postId}", post_jsonified, post_params)
  end

  def delete_post(client, postId) do
    delete(client, "/posts/#{postId}")
  end
end
