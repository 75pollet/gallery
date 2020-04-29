defmodule Mygallery.Repo.Migrations.AddRoleidToArtistsTable do
  use Ecto.Migration

  def change do
    alter table(:artists) do
      add(:role_id, :integer, default: nil)
    end
  end
end
