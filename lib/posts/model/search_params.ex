defmodule ExPnut.Posts.SearchParams do
  @moduledoc """
  [https://pnut.io/docs/api/resources/posts/search](https://pnut.io/docs/api/resources/posts/search)
  """

  defstruct [
    :q,
    :tags,
    :has_mentions,
    :mentions,
    :leading_mentions,
    :links,
    :link_domains,
    :is_directed,
    :is_revised,
    :is_nsfw,
    :is_reply,
    :client_id,
    :creator_id,
    :reply_to,
    :thread_id,
    :user_types,
    :raw_types,
    order: "relevance"
  ]
end
