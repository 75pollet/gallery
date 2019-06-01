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
    |> _add_hashed_password()
  end

  defp _add_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, _hash_password(pass))

      _ ->
        changeset
    end
  end

  defp _hash_password(password) do
    hash = Bcrypt.add_hash(password)
    hash.password_hash
  end
end
