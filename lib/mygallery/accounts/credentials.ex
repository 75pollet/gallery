defmodule Mygallery.Accounts.Credential do
  @moduledoc """
  credentials schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field(:username, :string)
    field(:email, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    belongs_to(:artist, Mygallery.Accounts.Artist)
    belongs_to(:user, Mygallery.Accounts.User)

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [
      :username,
      :email,
      :password,
      :artist_id,
      :user_id
    ])
    |> validate_required([:username, :password])
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
  end
end
