defmodule Mygallery.Accounts.Role do
  @moduledoc """
   this is the ROLES schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Mygallery.Accounts.{Artist, User}

  schema "roles" do
    field(:name, :string)
    has_many(:user, User)
    has_many(:artist, Artist)

    timestamps()
  end

  def changeset(role, attrs \\ %{}) do
    role
    |> cast(attrs, [
      :name
    ])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
