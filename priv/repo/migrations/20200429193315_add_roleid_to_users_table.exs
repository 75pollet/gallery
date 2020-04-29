defmodule Mygallery.Repo.Migrations.AddRoleidToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:role_id, :integer)
    end
  end
end
