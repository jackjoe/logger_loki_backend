defmodule LoggerLokiBackend.MixProject do
  use Mix.Project

  def project do
    [
      app: :logger_loki_backend,
      version: "0.0.3",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "Logger Loki Backend",
      source_url: "https://github.com/jackjoe/logger_loki_backend"
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
      {:httpoison, "~> 1.5"},
      {:json, "~> 1.3"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:benchee, "~> 1.0", only: :test},
      {:protobuf, "~> 0.5.3"},
      {:google_protos, "~> 0.1"},
      {:snappyer, "~> 1.2"}
    ]
  end

  defp description() do
    "Elixir Logger Backend for Grafana Loki"
  end

  defp package() do
    [
      name: "logger_loki_backend",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/jackjoe/logger_loki_backend"}
    ]
  end
end
