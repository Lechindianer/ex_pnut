defmodule ExPnut.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_pnut,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Ex.Pnut",
      source_url: "https://github.com/Lechindianer/ex_pnut"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.1"}
    ]
  end

  defp description() do
    "ExPnut is an Elixir wrapper for the pnut API."
  end

  defp package() do
    [
      licenses: ["ISC"],
      links: %{"GitHub" => "https://github.com/Lechindianer/ex_pnut"}
    ]
  end
end
