defmodule SRM.AuthErrorController do
  import Plug.Conn
  use SRM.Web, :controller

  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:unauthorized)
    |> render(SRM.SessionView, "wrong_credentials.json")
  end
end
