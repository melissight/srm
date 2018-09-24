defmodule SRM.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use SRM.Web, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SRM.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(SRM.ErrorView, :"404")
  end

  def call(conn, {:error, :wrong_credentials}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SRM.SessionView, "wrong_credentials.json")
  end

  def call(conn, {:error, :no_session}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SRM.SessionView, "no_session.json")
  end

  def call(conn, {:error, :invalid_issuer}) do
    conn
    |> put_status(:bad_request)
    |> render(SRM.SessionView, "invalid_issuer.json")
  end

  def call(conn, {:error, :already_taken_username}) do
    conn
    |> put_status(:bad_request)
    |> render(SRM.SessionView, "already_taken_username.json")
  end

  def call(conn, {:error, :already_taken_email}) do
    conn
    |> put_status(:bad_request)
    |> render(SRM.SessionView, "already_taken_email.json")
  end

  def call(conn, {:error, "Unknown resource type"}) do
    conn
    |> put_status(:unauthorized)
    |> render(SRM.SessionView, "wrong_token.json")
  end

  def call(conn, {:error, :user_not_found}) do
    conn
    |> put_status(:not_found)
    |> render(SRM.UserView, "404.json")
  end

  def call(conn, {:error, :forbidden}) do
    conn
    |> put_status(:forbidden)
    |> render(SRM.ErrorView, "permission_denied.json")
  end
end
