defmodule Mygallery.UserTest do
  use Mygallery.DataCase
  alias Mygallery.Accounts

  setup do
    valid_attributes = %{
      "first_name" => "Jane",
      "last_name" => "Doe",
      "user_name" => "janedoe",
      "email" => "janedoe@example.com",
      "phone_number" => "+345789012345",
      "password" => "pa$$word",
      "password_confirmation" => "pa$$word"
    }

    invalid_attributes = %{
      "first_name" => "Jane",
      "last_name" => "Doe",
      "user_name" => "janedoe",
      "email" => "janedoe@example.com",
      "phone_number" => "+345789012345"
    }

    [valid_attributes: valid_attributes, invalid_attributes: invalid_attributes]
  end

  test "successfully creates user", %{valid_attributes: valid_attributes} do
    {:ok, _} = Accounts.create_user(valid_attributes)
  end

  test "unsuccessful user creation", %{invalid_attributes: invalid_attributes} do
    {:error, _} = Accounts.create_user(invalid_attributes)
  end
end
