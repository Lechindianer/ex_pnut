defmodule ExPnut.Posts.PostParams do
  @moduledoc false

  defstruct include_deleted: 1,
            include_client: 1,
            include_counts: 1,
            include_html: 1,
            include_post_html: 1,
            include_bookmarked_by: 0,
            include_reposted_by: 0,
            include_directed_posts: 1,
            include_mention_posts: 1,
            include_copy_mentions: 1,
            include_replies: 1,
            include_muted: 0,
            include_raw: 0,
            include_post_raw: 0
end
