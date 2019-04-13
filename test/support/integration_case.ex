defmodule Mygallery.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Mygallery.ConnCase
      use PhoenixIntegration
    end
  end
end
