use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :srm, SRM.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Reduce number of rounds
config :bcrypt_elixir, log_rounds: 4

# Configure your database
config :srm, SRM.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "s2saPassword1",
  database: "srm_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure Guardian secret key
config :srm, SRM.Guardian,
  secret_key: "FLvNk/r9AI/WGB4jR8AWFS4LiXK0e0JmtOrJj5jliPNVdSP8l53LSY2W1WnRZ0EF"
