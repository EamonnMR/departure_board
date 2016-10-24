# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :departure_board,
  ecto_repos: [DepartureBoard.Repo]

# Configures the endpoint
config :departure_board, DepartureBoard.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sLAJhBgHCBCrzFz35fwSrxVdP0wj4sv3ry7ravrHVDtnWXxf5O/JtchGo8E+inhL",
  render_errors: [view: DepartureBoard.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DepartureBoard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
