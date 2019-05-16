defmodule MygalleryWeb.ArtistIntegrationTest do
  use MygalleryWeb.IntegrationCase

  test "artist sees registration form", %{conn: conn} do
    conn
    |> get("/")
    |> click_link("#reg")
    |> assert_response(html: "Register")
  end
end
