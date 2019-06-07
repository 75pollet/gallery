defmodule Mygallery.Accounts.User do
  @moduledoc """
  user schema
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Mygallery.Accounts.Credential

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
    field(:admin, :boolean)
    has_one(:credential, Credential)

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :phone_number
    ])
    |> validate_required([:phone_number, :first_name, :last_name])
  end

  def admin_changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :phone_number,
      :admin
    ])
    |> validate_required([:first_name, :last_name, :phone_number, :admin])
  end

  def admin_registration(user, params) do
    user
    |> admin_changeset(params)
    |> cast_assoc(:credential, with: &Credential.changeset/2, required: true)
  end
end
