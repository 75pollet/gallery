defmodule MygalleryWeb.Auth do
  @moduledoc """
  Auth plug
  """
  import Plug.Conn
  alias Mygallery.Accounts

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Accounts.get_artist_by_id(user_id)
    assign(conn, :current_user, user)
  end

  def login_artist(conn, email, password) do
    case Accounts.check_artist_email_and_pass(email, password) do
      {:ok, artist} -> {:ok, login(conn, artist)}
      {:error, :unauthorized} -> {:error, :unauthorized, conn}
      {:error, :not_found} -> {:error, :not_found, conn}
    end
  end

  @spec login(Plug.Conn.t(), atom() | %{id: any()}) :: Plug.Conn.t()
  def login(conn, artist) do
    conn
    |> assign(:current_user, artist)
    |> put_session(:user_id, artist.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    conn
    |> configure_session(drop: true)
  end
end
