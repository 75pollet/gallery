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
end
