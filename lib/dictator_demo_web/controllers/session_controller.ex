defmodule DictatorDemoWeb.SessionController do
  use DictatorDemoWeb, :controller

  alias DictatorDemo.Accounts
  alias DictatorDemo.Accounts.Crypto.Password
  alias DictatorDemoWeb.Auth

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"password" => password, "email" => email}) do
    user = Accounts.get_user_by_email!(email)

    if Password.verify(password, user.encrypted_password) do
      conn
      |> Auth.Session.sign_in(user)
      |> redirect(to: "/posts")
    else
      conn
      |> send_resp(401, "")
    end
  end
end
