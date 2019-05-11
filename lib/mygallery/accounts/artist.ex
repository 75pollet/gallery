defmodule Mygallery.Accounts.Artist do
  @moduledoc """
   this is the artist schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:username, :string)
    field(:id_number, :string)
    field(:phone_number, :string)
    field(:location, :string)
    field(:date_of_birth, :date)
    field(:email, :string)
    field(:avatar, :string)
    field(:password, :string)
    field(:password_confirmation, :string)

    timestamps()
  end

  def changeset(artist, attrs \\ %{}) do
    artist
    |> cast(attrs, [
      :first_name,
      :last_name,
      :username,
      :id_number,
      :phone_number,
      :location,
      :date_of_birth,
      :email,
      :avatar,
      :password,
      :password_confirmation
    ])
    |> validate_required([:username, :id_number, :phone_number, :password, :password_confirmation])
    |> unique_constraint(:username)
  end
end
