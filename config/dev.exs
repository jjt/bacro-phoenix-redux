use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :bacro, Bacro.Endpoint,
  http: [port: 4000],
  url: [host: "bacro.localdev.com"],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  watchers: [{Path.expand("webpack.devserver.js"), []}]

# Watch static and templates for browser reloading.
config :bacro, Bacro.Endpoint,
  live_reload: [
    patterns: [
      # ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :bacro, Bacro.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bacro_dev",
  size: 10 # The amount of database connections in the pool

import_config "dev.secret.exs"
