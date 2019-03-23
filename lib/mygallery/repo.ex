defmodule Mygallery.Repo do
  use Ecto.Repo,
    otp_app: :mygallery,
    adapter: Ecto.Adapters.Postgres
end
