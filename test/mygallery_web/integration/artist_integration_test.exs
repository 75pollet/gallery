defmodule MygalleryWeb.ArtistIntegrationTest do
  use MygalleryWeb.IntegrationCase
  alias Mygallery.Accounts

  setup do
    valid_attr = %{
      "credential" => %{
        "email" => "lufakyw@mailinator.com",
        "password" => "Pa$$w0rd!",
        "password_confirmation" => "Pa$$w0rd!",
        "username" => "tawyx"
      },
      "date_of_birth" => %{"day" => "13", "month" => "7", "year" => "1999"},
      "first_name" => "Aurelia",
      "id_number" => "139",
      "last_name" => "Schultz",
      "location" => "Sit sed dolor et es",
      "phone_number" => "+1 (483) 939-4553"
    }

    Accounts.create_artist(valid_attr)
    :ok
  end

  test "artist sees registration form", %{conn: conn} do
    conn
    |> get("/")
    |> click_link("#reg")
    |> assert_response(html: "Register")
  end

  test "artist  successful login test", %{conn: conn} do
    conn
    |> get("/sessions/new")
    |> follow_form(%{session: %{email: "lufakyw@mailinator.com", password: "Pa$$w0rd!"}})
    |> assert_response(html: "Successful login")
  end

  test "artist invalid password login test", %{conn: conn} do
    conn
    |> get("/sessions/new")
    |> follow_form(%{session: %{email: "lufakyw@mailinator.com", password: "Pa$$123!"}})
    |> assert_response(html: "Invalid password or email")
  end

  test "login test for non-existing artist", %{conn: conn} do
    conn
    |> get("/sessions/new")
    |> follow_form(%{session: %{email: "lukeshaw@mail.com", password: "Pa$$123!"}})
    |> assert_response(html: "The account does not exist")
  end
end
