defmodule :"Elixir.Mygallery.Repo.Migrations.Create-admin-credentials" do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add(:username, :string, null: false)
      add(:email, :string)
      add(:password_hash, :string)
      add(:artist_id, references(:artists, on_delete: :delete_all))
      add(:user_id, references(:users, on_delete: :delete_all))

      timestamps()
    end

    create(unique_index(:credentials, [:username, :email]))
  end
end
