# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_test,
  ecto_repos: [HelloTest.Repo]

# Configures the endpoint
config :hello_test, HelloTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m9OmfQP3chEtdLHBKB9gjJcU9HCauQIvg8aKwQAwlA2U8m8t5FZdtNTwhVc8P4j+",
  render_errors: [view: HelloTestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloTest.PubSub,
  live_view: [signing_salt: "z6k1Ye6E"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
