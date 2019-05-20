defmodule :"Elixir.Mygallery.Repo.Migrations.Remove-admin-credentials" do
  use Ecto.Migration

  def change do
    alter table(:artists) do
      remove(:username)
      remove(:email)
      remove(:password)
      remove(:password_confirmation)
    end
  end
end
