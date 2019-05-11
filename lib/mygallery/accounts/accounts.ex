defmodule Mygallery.Accounts do
  @moduledoc """
      this is the accounts context
  """
  alias Mygallery.Accounts.Artist
  alias Mygallery.Repo

  @doc """
      creates an artist
  """
  def create_artist(attrs) do
    attrs =
      attrs
      |> Map.replace!(
        "password",
        hash_password(attrs["password"])
      )
      |> Map.replace!(
        "password_confirmation",
        hash_password(attrs["password_confirmation"])
      )

    %Artist{}
    |> Artist.changeset(attrs)

    # |> hash_password
    |> Repo.insert()
  end

  def hash_password(password) do
    hash = Bcrypt.add_hash(password)
    hash.password_hash
  end

  def get_all_artists do
    Artist
    |> Repo.all()
  end

  @doc """
    delete an artist
  """
  def delete_artist(artist) do
    Repo.delete(artist)
  end

  def get_artist_by_id(id) do
    Artist
    |> Repo.get(id)
  end

  def update_artist(artist, attr) do
    artist
    |> Artist.changeset(attr)
    |> Repo.update()
  end
end
