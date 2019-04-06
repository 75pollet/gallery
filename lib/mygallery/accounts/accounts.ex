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
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end

  def get_all_artists do
    Artist
    |> Repo.all()
  end
end
