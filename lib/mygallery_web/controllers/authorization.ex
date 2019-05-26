defmodule MygalleryWeb.Authorization do
  use Phoenix.Controller
  import Plug.Conn

def init(opts) do
  opts
end
def call(conn, _opts) do
  if conn.assigns.current_user do
    conn
  else
    conn
    |> put_flash(:error, "You must login to access this page")
    |> redirect(to: "/")
    |> halt()
  end
end

end
