defmodule MygalleryWeb.LayoutView do
  use MygalleryWeb, :view
  alias Mygallery.Accounts

  def role_id(name) do
    Accounts.get_role(name)
  end
end
