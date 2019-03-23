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
  end