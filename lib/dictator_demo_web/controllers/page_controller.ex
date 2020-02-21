defmodule DictatorDemoWeb.PageController do
  use DictatorDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
