defmodule GW.Router do
  use GW.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GW do
    pipe_through :api

    scope "/v1" do
      post "/registrations", RegistrationController, :create

      get "/current_user", CurrentUserController, :show
      post "/sessions", SessionController, :create
      delete "/sessions", SessionController, :delete

      resources "/time_entries", TimeEntryController, only: [:index]
    end
  end

  scope "/", GW do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GW.Web do
  #   pipe_through :api
  # end
end
