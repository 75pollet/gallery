use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mygallery, MygalleryWeb.Endpoint,
  http: [port: 4001],
  server: false

# configure phoenix integration
config :phoenix_integration,
  endpoint: Mygallery.Endpoint

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mygallery, Mygallery.Repo,
  username: "postgres",
  password: "postgres",
  database: "mygallery_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
