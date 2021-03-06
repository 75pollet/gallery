defmodule Mygallery.Accounts.Artist do
  @moduledoc """
   this is the artist schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Mygallery.Accounts.{Credential, Role}

  schema "artists" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:id_number, :string)
    field(:phone_number, :string)
    field(:location, :string)
    field(:date_of_birth, :date)
    field(:avatar, :string)
    has_one(:credential, Credential)
    belongs_to(:role, Role)

    timestamps()
  end

  def changeset(artist, attrs \\ %{}) do
    artist
    |> cast(attrs, [
      :first_name,
      :last_name,
      :id_number,
      :phone_number,
      :location,
      :date_of_birth,
      :avatar,
      :role_id
    ])
    |> validate_required([:first_name, :last_name, :phone_number])
    |> unique_constraint(:id_number)
  end

  def registration_changeset(artist, params) do
    artist
    |> changeset(params)
    |> cast_assoc(:credential, with: &Credential.changeset/2, required: true)
  end
end
