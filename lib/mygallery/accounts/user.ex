defmodule Mygallery.Accounts.User do
  @moduledoc """
  user schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Mygallery.Accounts.{Credential, Role}

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
    field(:admin, :boolean)
    has_one(:credential, Credential)
    belongs_to(:role, Role)

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :phone_number,
      :admin,
      :role_id
    ])
    |> validate_required([:first_name, :last_name, :phone_number, :admin, :role_id])
  end

  def user_registration(user, params) do
    user
    |> changeset(params)
    |> cast_assoc(:credential, with: &Credential.changeset/2, required: true)
  end
end
