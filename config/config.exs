# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sciencevideo,
  ecto_repos: [Sciencevideo.Repo]

# Configures the endpoint
config :sciencevideo, SciencevideoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2jdPtzlifk4t81c/87N2GcC22+c1Q1xLDyi8H+DecXbFUYEmOcQXm3x0wXzRngFR",
  render_errors: [view: SciencevideoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sciencevideo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configure Google OAuth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
  ]
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
