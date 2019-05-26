defmodule MygalleryWeb.SessionController do
  use MygalleryWeb, :controller
  alias MygalleryWeb.Auth

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Auth.login_artist(conn, email, password) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Successful login")
        |> redirect(to: "/")

      {:error, :unauthorized, conn} ->
        conn
        |> put_flash(:error, "Invalid password or email")
        |> redirect(to: Routes.session_path(conn, :new))

      {:error, :not_found, conn} ->
        conn
        |> put_flash(:error, "The account does not exist")
        |> redirect(to: Routes.artist_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> Auth.logout()
    |> put_flash(:info, "You have logged out")
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
