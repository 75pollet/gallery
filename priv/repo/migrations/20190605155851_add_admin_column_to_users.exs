defmodule Mygallery.Repo.Migrations.AddAdminColumnToUsers do
  @moduledoc """
  add admin  column
  """
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:admin, :boolean, default: false)
    end
  end
end
