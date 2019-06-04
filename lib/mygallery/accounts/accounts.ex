defmodule Mygallery.Accounts do
  @moduledoc """
      this is the accounts context
  """
  import Ecto.Query

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
    |> Repo.preload(:credential)
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

  def check_artist_email_and_pass(email, password) do
    artist = get_artist_by_email(email)

    cond do
      artist && Bcrypt.verify_pass(password, artist.credential.password_hash) ->
        {:ok, artist}

      artist ->
        {:error, :unauthorized}

      true ->
        Bcrypt.no_user_verify()
        {:error, :not_found}
    end
  end

  def get_artist_by_email(email) do
    artist = from(a in Artist, join: c in assoc(a, :credential), where: c.email == ^email)

    artist
    |> Repo.one()
    |> Repo.preload(:credential)
  end
end
