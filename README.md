# ExPnut

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_pnut` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_pnut, "~> 0.1.0"}
  ]
end
```

## Usage

Create `config/dev.exs` with the following content:

```elixir
use Mix.Config

config :ex_pnut,
  user_token:
    "YOUR_USER_TOKEN"
```

The first step is to create a client:

```elixir
client = Application.get_env(:ex_pnut, :user_token)
  |> ExPnut.Client.new()
```

To receive your posts:

```elixir
ExPnut.Posts.Streams.me(client)
```

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_pnut](https://hexdocs.pm/ex_pnut).

