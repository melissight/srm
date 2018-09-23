defmodule GW.Router do
  use GW.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :unauthorized do
    plug(:fetch_session)
  end

  pipeline :authorized do
    plug(:fetch_session)

    plug(
      Guardian.Plug.Pipeline,
      module: GW.Guardian,
      error_handler: GW.AuthErrorController
    )

    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.LoadResource)
  end

  scope "/api", GW do
    pipe_through(:api)

    scope "/" do
      pipe_through(:unauthorized)

      post("/sessions", SessionController, :create)
      resources("/users", UserController, only: [:create])
    end

    scope "/" do
      pipe_through(:authorized)

      delete("/sessions", SessionController, :delete)
      post("/sessions/refresh", SessionController, :refresh)
      resources("/users", UserController, except: [:create])
    end
  end

  scope "/", GW do
    # Use the default browser stack
    pipe_through(:browser)

    get("/*path", PageController, :index)
  end
end
