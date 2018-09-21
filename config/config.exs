# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gw,
  ecto_repos: [GW.Repo]

# Configures the endpoint
config :gw, GW.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nOocgA9JwcCgcJMYroatdMhnJMPrUWoAtaUcB5qWG5XUH784UCA9iBaf9c8T5ZaX",
  render_errors: [view: GW.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GW.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
