defmodule ExPnut.Posts.Bookmarks do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Bookmarking is an action for users to keep track of posts. You can see others' bookmarks as well.

  [https://pnut.io/docs/api/resources/posts/bookmarks](https://pnut.io/docs/api/resources/posts/bookmarks)
  """

  @doc """
  Retrieve a list of bookmarks made by the specified user.

  Returned posts may include a note string field if looking up bookmarks made by the authorized user.
  """
  def get_post(client, user_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/users/#{user_id}/bookmarks", post_params)
  end

  @doc """
  Bookmark a post.
  """
  def bookmark(client, post_id, %PostParams{} = post_params \\ %PostParams{}) do
    put_json(client, "/posts/#{post_id}/bookmark", [], post_params)
  end

  @doc """
  Bookmark a post.
  """
  def bookmark_with_note(client, post_id, note, %PostParams{} = post_params \\ %PostParams{}) do
    note_jsonified =
      note
      |> Jason.encode()
      |> elem(1)

    case String.length(note) > 128 do
      true -> {:error, :note_text_too_long}
      false -> put_json(client, "/posts/#{post_id}/bookmark", note_jsonified, post_params)
    end
  end

  @doc """
  Delete a bookmark.
  """
  def delete_bookmark(client, post_id) do
    delete(client, "/posts/#{post_id}/bookmark")
  end
end
