defmodule MygalleryWeb.ArtistView do
  use MygalleryWeb, :view

  def year_limit do
    (DateTime.utc_now().year - 5)..1950
  end
end
