defmodule Mygallery.ArtistTest do
  use Mygallery.DataCase
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


    [valid_attr: valid_attr]
  end

  test "creates an artist successfully", %{valid_attr: valid_attr} do
    {:ok, _something} = Accounts.create_artist(valid_attr)
  end
end
