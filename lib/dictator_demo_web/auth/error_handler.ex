defmodule DictatorDemoWeb.Auth.ErrorHandler do
  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    DictatorDemoWeb.ErrorController.call(conn, {:error, type})
  end
end
