defmodule MygalleryWeb.ArtistController do
  use MygalleryWeb, :controller
  alias Mygallery.Accounts
  alias Mygallery.Accounts.Artist

  def new(conn, _params) do
    changeset = Artist.changeset(%Artist{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artist" => params}) do
    case Accounts.create_artist(params) do
      {:ok, _property} ->
        conn
        |> put_flash(:info, "Successfully Signed Up")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "There was a problem signing up")
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist = Accounts.get_artist_by_id(id)
    render(conn, "show.html", artist: artist)
  end

  def index(conn, _params) do
    artists = Accounts.get_all_artists()
    render(conn, "index.html", artists: artists)
  end
end
