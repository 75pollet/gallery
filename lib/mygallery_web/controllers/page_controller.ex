defmodule MygalleryWeb.PageController do
  use MygalleryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
