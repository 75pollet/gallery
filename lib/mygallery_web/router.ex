defmodule MygalleryWeb.Router do
  use MygalleryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MygalleryWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MygalleryWeb do
    # Use the default browser stack
    pipe_through :browser

    get "/", PageController, :index
    resources "/artist", ArtistController
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MygalleryWeb do
  #   pipe_through :api
  # end
end
