defmodule Forcex.Mixfile do
  use Mix.Project

  @description """
    Elixir library for the Force.com / SalesForce / SFDC REST API
  """

  def project do
    [
      app: :forcex,
      version: "0.6.1",
      elixir: "~> 1.0",
      name: "Forcex",
      description: @description,
      package: package(),
      # compilers: [:forcex] ++ Mix.compilers,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.post": :test,
        docs: :dev,
        "hex.docs": :dev,
      ],
      dialyzer: [
        plt_add_deps: true,
        plt_file: ".local.plt",
        flags: [
          # "-Wunmatched_returns",
          # "-Wrace_conditions",
          # "-Wunderspecs",
          # "-Wunknown",
          # "-Woverspecs",
          # "-Wspecdiffs",
        ]
      ],
      deps: deps(),
   ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison, :erlsom, :exjsx, :ssl]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.10.0"},
      {:exjsx, "~> 3.1"},
      {:poison, "~> 3.0"},
      {:timex, "~> 2.0 or ~> 3.0"},
      {:erlsom, "~> 1.4"},
      {:excoveralls, "~> 0.5", only: :test},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 1.1", only: :dev, override: true},
      {:dialyxir, "~> 0.4", only: :dev},
    ]
  end

  defp package do
    [ maintainers: ["Jeff Weiss"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/resuelve/forcex"} ]
  end
end
