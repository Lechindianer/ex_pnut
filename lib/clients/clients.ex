defmodule ExPnut.Clients do
  import ExPnut.Helper.HTTP

  @moduledoc """
  Client name can contain any Unicode characters. Be sure to escape it if necessary.

  Endpoints:
  - Get a user's clients
  - Get a client

  [https://pnut.io/docs/api/resources/clients](https://pnut.io/docs/api/resources/clients)
  """

  @doc """
  Retrieve a list of active clients created by a user.

  Returns a list of clients

  ## Parameters

  - user_id: ID of the user to list clients from.
  """
  def get_client(client, user_id) do
    get(client, "/users/#{user_id}/clients")
  end

  @doc """
  Retrieve details on a public client, by client ID.

  Returns the detailed client object

  ## Parameters

  - client_id: ID of the client to retrieve.
  """
  def get_client_details(client, client_id) do
    get(client, "/clients/#{client_id}")
  end
end
