defmodule Mygallery.ArtistTest do
  use Mygallery.DataCase
  alias Mygallery.Accounts

  setup do
    valid_attr = %{
      "first_name" => "Akinyi",
      "last_name" => "Otieno",
      "username" => "thatgirl",
      "id_number" => "123456",
      "phone_number" => "0738908786",
      "location" => "Boya",
      "date_of_birth" => ~D[2000-01-01],
      "email" => "akinyi@gmail.com",
      "password" => "pass1",
      "password_confirmation" => "pass1"
    }

    [valid_attr: valid_attr]
  end

  test "creates an artist successfully", %{valid_attr: valid_attr} do
    {:ok, _something} = Accounts.create_artist(valid_attr)
  end
end
