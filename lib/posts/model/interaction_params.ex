defmodule ExPnut.Posts.InteractionParams do
  @moduledoc false

  defstruct filter_bookmark: 0,
            filter_repost: 0,
            filter_reply: 0,
            exclude_bookmark: 0,
            exclude_repost: 0,
            exclude_reply: 0
end
