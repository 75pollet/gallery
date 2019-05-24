defmodule Mygallery.Accounts do
  @moduledoc """
      this is the accounts context
  """
  alias Mygallery.Accounts.Artist
  alias Mygallery.Accounts.User
  alias Mygallery.Repo

  @doc """
      creates an artist
  """
  def create_artist(attrs) do
    %Artist{}
    |> Artist.registration_changeset(attrs)
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

  def create_user(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
