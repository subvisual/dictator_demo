defmodule DictatorDemoWeb.ErrorController do
  use Phoenix.Controller

  alias DictatorDemoWeb.ErrorView

  def call(conn, {:error, :unauthenticated}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ErrorView)
    |> render(:"401")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :bad_request}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render(:"400")
  end

  def call(conn, {:error, :already_authenticated}) do
    conn
    |> redirect(to: "/")
  end
end
