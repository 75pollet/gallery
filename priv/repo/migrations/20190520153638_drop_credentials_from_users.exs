defmodule Mygallery.Repo.Migrations.DropCredentialsFromUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove(:email)
      remove(:password)
      remove(:password_confirmation)
    end
  end
end
