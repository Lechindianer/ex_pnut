defmodule ExPnut.Posts.NewPost do
  @moduledoc false

  @derive {Jason.Encoder, only: [:text, :reply_to, :is_nsfw, :"entities.parse_links", :"entities.parse_markdown_links"]}

  @enforce_keys [:text]

  defstruct [:text, :reply_to, is_nsfw: false, "entities.parse_links": true, "entities.parse_markdown_links": true]
end