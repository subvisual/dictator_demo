# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dictator_demo,
  ecto_repos: [DictatorDemo.Repo]

# Configures the endpoint
config :dictator_demo, DictatorDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vd69xw6LXnwEOE90DP32TSI6WY+hx0yNSV+03/bsYZ22zHo/xKk2qLeiz9sKG/5/",
  render_errors: [view: DictatorDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DictatorDemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :dictator_demo, DictatorDemoWeb.Auth,
  issuer: "dictator_demo",
  secret_key: "rihc2dhkstK3K/1rYtq7vP0VeEcl91rqujr0HHoAV2KapGWySeulM+BODALTlzlT"

config :dictator_demo, DictatorDemoWeb.Auth.Pipelines.EnsureAuthenticated,
  module: DictatorDemoWeb.Auth,
  error_handler: DictatorDemoWeb.Auth.ErrorHandler

config :dictator_demo, DictatorDemoWeb.Auth.Pipelines.EnsureUnauthenticated,
  module: DictatorDemoWeb.Auth,
  error_handler: DictatorDemoWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
