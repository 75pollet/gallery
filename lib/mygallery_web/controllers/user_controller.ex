defmodule MygalleryWeb.UserController do
  use MygalleryWeb, :controller
  alias Mygallery.Accounts
  alias Mygallery.Accounts.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => params}) do
    case Accounts.create_user(params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Registration Successful")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Unsuccessful try again")
        |> render("new.html", changeset: changeset)
    end
  end
end
