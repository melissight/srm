defmodule GW.AuthErrorController do
  import Plug.Conn
  use GW.Web, :controller

  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:unauthorized)
    |> render(GW.SessionView, "wrong_credentials.json")
  end
end
