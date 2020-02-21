defmodule DictatorDemoWeb.Plug.AssignCurrentUser do
  import Plug.Conn

  @behaviour Plug

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    current_user = Guardian.Plug.current_resource(conn)

    assign(conn, :current_user, current_user)
  end
end
