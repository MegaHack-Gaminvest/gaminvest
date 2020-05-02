# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gaminvest,
  ecto_repos: [Gaminvest.Repo]

# Configures the endpoint
config :gaminvest, GaminvestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4vGRqtA2OE5WzMqhB1A/rwVuGJsgQTEjglWnJB8RbBllXPcXz3OOpMwRxfzEJD6i",
  render_errors: [view: GaminvestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gaminvest.PubSub,
  live_view: [signing_salt: "HNE+P3bu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
