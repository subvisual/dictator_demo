defmodule DictatorDemoWeb.Auth.Session do
  alias DictatorDemo.Accounts.User
  alias DictatorDemoWeb.Auth

  def sign_in(conn, %User{} = user) do
    conn
    |> Auth.Plug.sign_in(user)
  end
end
