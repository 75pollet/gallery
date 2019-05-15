defmodule MygalleryWeb.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use MygalleryWeb.ConnCase
      use PhoenixIntegration
    end
  end
end
