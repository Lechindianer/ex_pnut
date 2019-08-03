defmodule ExPnut.Token do
  import ExPnut.Helper.HTTP

  @moduledoc """
  Interactions with the authenticated token

  Endpoints:
  - Get the current token
  - Delete the current token

  [https://pnut.io/docs/api/resources/token](https://pnut.io/docs/api/resources/token)
  """

  @doc """
  Retrieve an object with the currently authenticated token, username, and user ID.

  Includes `data.email` if `email` scope is authorized. Includes `markdown_text` in user object.

  Returns the requested token
  """
  def get_token(client) do
    get(client, "/token", nil)
  end

  @doc """
  Delete the currently authenticated token.

  Note that this only deletes the currently authenticated token, and the user will still not be required to
  reauthorize scopes in the future that have been authorized. For the user to revoke all access tokens for the client,
  they must do so manually from their account on pnut.io.

  Returns the deleted token
  """
  def delete_token(client) do
    delete(client, "/token")
  end
end
