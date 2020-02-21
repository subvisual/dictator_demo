defmodule DictatorDemoWeb.Auth.Pipelines.EnsureAuthenticated do
  use Guardian.Plug.Pipeline, otp_app: :dictator_demo

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyCookie
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource

  plug DictatorDemoWeb.Plug.AssignCurrentUser
end
