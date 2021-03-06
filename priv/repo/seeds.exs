alias Mygallery.Accounts

{:ok, admin_role} = Accounts.create_role(%{name: "admin"})

Accounts.create_user(%{
  "credential" => %{
    "email" => "admin@example.com",
    "password" => "adminpass!",
    "username" => "admin"
  },
  "first_name" => "pollet",
  "last_name" => "wayu",
  "phone_number" => "+2222222222222",
  "admin" => true,
  "role_id" => admin_role.id
})

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mygallery.Repo.insert!(%Mygallery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
