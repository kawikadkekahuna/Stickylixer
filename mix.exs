defmodule Sticky.MixProject do
  use Mix.Project

  def project do
    [
      app: :stickylixer,
      version: "0.1.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      description: "Sticky.io Elixir Client",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      name: "Stickylixer",
      source_url: "https://github.com/kawikadkekahuna/stickylixer",
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Sticky, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      files: ["lib", "LICENSE*", "mix.exs", "README*"],
      licenses: ["New BSD"],
      links: %{
        "GitHub" => "https://github.com/kawikadkekahuna/stickylixer"
      },
      maintainers: ["Kawika Kekahuna"]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.4.0"},
      {:hackney, "~> 1.16.0"},
      {:jason, "~> 1.0"},
      {:excoveralls, "~> 0.13.3", only: :test},
      {:retry, "~> 0.14.1"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
