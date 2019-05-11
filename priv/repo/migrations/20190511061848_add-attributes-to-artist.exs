defmodule :"Elixir.Mygallery.Repo.Migrations.Add-attributes-to-artist" do
  use Ecto.Migration

  def change do
    alter table(:artists) do
      add(:location, :string)
      add(:date_of_birth, :date)
      add(:email, :string)
      add(:avatar, :string)
    end
  end
end
