defmodule ExPnut.Posts.Lifecycle do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.NewPost
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Create, update or delete posts.

  [https://pnut.io/docs/api/resources/posts/lifecycle](https://pnut.io/docs/api/resources/posts/lifecycle)
  """

  @doc """
  Create a post.

  On creation, you can automatically update the "personal" stream marker to the post's ID by including update_marker=1 in the query string.

  Posts from the same human- or feed-type user cannot contain the same text within 120 seconds.

  An application/json Content-Type is preferred over form. Normal links and markdown links are parsed by the server by default.
  """
  def posts(client, %NewPost{} = new_post, %PostParams{} = post_params \\ %PostParams{}) do
    post_jsonified =
      new_post
      |> Jason.encode()
      |> elem(1)

    post(client, "/posts", post_jsonified, post_params)
  end

  @doc """
  Edit or "revise" a post.

  - Can only be done within 300 seconds of the original post's creation
  - Can only be done once to a post
  - Must contain the same entities that were in the original post (Positions can change. Links can be formatted in any way, but the URLs have to be the same)

  Once a revision has been made, the original post can still be retrieved from the Revisions endpoint.

  Reposts made before the revision will continue to point at the original post.
  """
  def revise_post(
        client,
        postId,
        %NewPost{} = new_post,
        %PostParams{} = post_params \\ %PostParams{}
      ) do
    post_jsonified =
      new_post
      |> Jason.encode()
      |> elem(1)

    put_json(client, "/posts/#{postId}", post_jsonified, post_params)
  end

  @doc """
  Delete a post.
  """
  def delete_post(client, postId) do
    delete(client, "/posts/#{postId}")
  end
end
