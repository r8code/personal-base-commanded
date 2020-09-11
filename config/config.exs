# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :personal_base,
  ecto_repos: [PersonalBase.Repo]

config :personal_base,
  event_stores: [PersonalBase.EventStore]

config :personal_base, PersonalBase.EventApp,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: PersonalBase.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: PersonalBase.Repo

config :personal_base, PersonalBase.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "personal_base_eventstore_dev",
  hostname: "localhost",
  pool_size: 10

config :personal_base, PersonalBaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NisLpfmzI/H7YEPp7mzmcVuP3ARLNamDlad3n0KukodNReVRmHaQrFqG7AnF1gJ+",
  render_errors: [view: PersonalBaseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PersonalBase.PubSub,
  live_view: [signing_salt: "kZUtmkvd"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
