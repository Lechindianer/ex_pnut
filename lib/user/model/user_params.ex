defmodule ExPnut.User.UserParams do
  @moduledoc """
  Any endpoint that returns user objects (including any that return post objects, message objects, etc.) can be
  subject to these parameters.

  [https://pnut.io/docs/api/resources/users](https://pnut.io/docs/api/resources/users)
  """

  defstruct include_html: 1,
            include_user_html: 1,
            include_counts: 1,
            include_user: 1,
            include_presence: 0,
            include_raw: 0,
            include_user_raw: 0
end
