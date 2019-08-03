defmodule ExPnut.Other.TextProcessor do
  import ExPnut.Helper.HTTP
  alias ExPnut.Posts.PostParams

  @moduledoc """
  Use this endpoint to test rendering of post content. Particularly useful for debugging, or if you want to show a
  user exactly how the API will process their post.

  Endpoints:
  - Test text processing

  [https://pnut.io/docs/api/resources/other/text-process](https://pnut.io/docs/api/resources/other/text-process)
  """

  @doc """
  Submit a Content-Type of `application/json` body as if creating a post. Returns an object containing the parsed text
  with entities.

  ## Parameters

  - object_type: `post` or `message`. By default, `text` character length is restricted to 256, like a post. You may
  change it to rendering like a message with up to 2048 characters by including this parameter with a value of
  `message`.

  ## Examples

      iex> ExPnut.Other.TextProcessor.text_process(client, %{"text" => "hello world!"})
      %{
        html: "<span itemscope itemtype=\"https://pnut.io/schemas/Post\">hello world!</span>",
        links: [],
        mentions: [],
        tags: [],
        text: "hello world!"
      }
  """
  def text_process(client, text, %PostParams{} = post_params \\ %PostParams{}) do
    text_jsonified = ExPnut.Helper.JSON.jsonify(text)

    post(client, "/text/process", text_jsonified, post_params)
  end
end
