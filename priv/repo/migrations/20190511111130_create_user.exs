defmodule Mygallery.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:first_name, :string, null: false)
      add(:last_name, :string)
      add(:email, :string, null: false)
      add(:phone_number, :string, null: false)
      add(:password, :string)
      add(:password_confirmation, :string)

      timestamps()
    end
  end
end
