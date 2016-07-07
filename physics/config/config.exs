# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :physics, Physics.Repo,
	adapter: Ecto.Adapters.Postgres,
	database: "physics",
	username: "postgres",
	password: "postgres",
	hostname: "localhost"

config :physics, ecto_repos: [Physics.Repo]