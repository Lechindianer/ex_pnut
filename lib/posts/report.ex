defmodule ExPnut.Posts.Report do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  These are the current reasons that will be honored for reporting:

  - "account_type": posting in a behavior counter to the purposes of account types
  - "nsfw": unflagged mature material according to the community guidelines
  - "soliciting": unwelcome soliciting
  - "user_abuse": use of the API or network to abuse another user

  Endpoints:
  - Report a post

  [https://pnut.io/docs/api/resources/posts/report](https://pnut.io/docs/api/resources/posts/report)
  """

  @doc """
  Report a post for abuse.

  ## Parameters

  - post_id: ID of the post to report.
  - reason: One of: "account_type", "nsfw", "soliciting", "user_abuse".
  """
  def report(client, post_id, reason, %PostParams{} = post_params \\ %PostParams{}) do
    reason = {:multipart, [{"reason", reason}]}

    post(client, "/posts/#{post_id}/report", reason, post_params)
  end
end
