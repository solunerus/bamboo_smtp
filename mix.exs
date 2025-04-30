defmodule BambooSmtp.Mixfile do
  use Mix.Project

  @project_url "https://github.com/solunerus/bamboo_smtp"
  @version "5.0.0"

  def project do
    [
      app: :bamboo_smtp,
      version: @version,
      elixir: "~> 1.18",
      source_url: @project_url,
      homepage_url: @project_url,
      name: "Bamboo SMTP Adapter",
      description: "A Bamboo adapter for SMTP",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: [:gen_smtp, :logger, :bamboo]]
  end

  defp deps do
    [
      # core
      {:bamboo, "~> 2.4.0"},
      {:gen_smtp, git: "https://github.com/gen-smtp/gen_smtp.git", branch: "master"},

      # dev / test
      {:credo, "~> 1.7.12", only: [:dev, :test]},
      {:excoveralls, "~> 0.18.5", only: :test},

      # doc
      {:earmark, ">= 1.4.47", only: :docs},
      {:ex_doc, "~> 0.37.3", only: :docs},
      {:inch_ex, "~> 2.0.0", only: :docs}
    ]
  end

  defp package do
    [
      maintainers: ["Soluciones Nerus"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "#{@project_url}/blob/main/CHANGELOG.md",
        "GitHub" => @project_url
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md", "CHANGELOG.md": [title: "Changelog"]]
    ]
  end
end
