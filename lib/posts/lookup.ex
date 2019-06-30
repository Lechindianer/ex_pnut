defmodule ExPnut.Posts.Lookup do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc false

  def get_post(client, post_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/#{post_id}", post_params)
  end

  def get_posts(client, post_ids, %PostParams{} = post_params \\ %PostParams{}) do
    post_ids_query_param = Enum.join(post_ids, ",")

    get(client, "/posts?ids=#{post_ids_query_param}", post_params)
  end

  def get_revisions(client, post_id, %PostParams{} = post_params \\ %PostParams{}) do
    get(client, "/posts/#{post_id}/revisions", post_params)
  end
end
