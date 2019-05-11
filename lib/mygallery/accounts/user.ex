defmodule Mygallery.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:phone_number, :string)
    field(:password, :string)
    field(:password_confirmation, :string)
    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :password,
      :password_confirmation
    ])
    |> validate_required([:email, :password, :password_confirmation, :phone_number, :first_name])
    |> unique_constraint(:email)
  end
end
