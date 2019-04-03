defmodule :"Elixir.Mygallery.Repo.Migrations.Create-artist" do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string, null: false
      add :id_number, :string, null: false
      add :phone_number, :string
      add :password, :string
      add :password_confirmation, :string

      timestamps()
    end

    create unique_index(:artists, [:username])
  end
end
